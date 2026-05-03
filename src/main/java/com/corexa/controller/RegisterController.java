package com.corexa.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

import com.corexa.model.AddressModel;
import com.corexa.model.UserModel;
import com.corexa.service.RegisterService;
import com.corexa.util.ImageUtil;
import com.corexa.util.PasswordUtil;
import com.corexa.util.RedirectionUtil;
import com.corexa.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

/**
 * RegisterController handles user registration requests and processes form
 * submissions. It also manages file uploads and account creation.
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/register" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final ImageUtil imageUtil = new ImageUtil();
	private final RegisterService registerService = new RegisterService();

	/**
	 * Handles GET requests to the register page.
	 *
	 * @param request  HttpServletRequest object
	 * @param response HttpServletResponse object
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher(RedirectionUtil.registerUrl).forward(req, resp);
	}

	/**
	 * Handles POST requests for user registration.
	 *
	 * @param request  HttpServletRequest object
	 * @param response HttpServletResponse object
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// Validate and extract student model
			String validationMessage = validateRegistrationForm(req);
			if (validationMessage != null) {
				handleError(req, resp, validationMessage);
				return;
			}

			UserModel userModel = extractUserModel(req);
			Boolean isAdded = registerService.addUser(userModel);

			if (isAdded == null) {
				handleError(req, resp, "Our server is under maintenance. Please try again later!");
			} else if (isAdded) {
				try {
					if (uploadImage(req)) {
						handleSuccess(req, resp, "Your account is successfully created!", RedirectionUtil.loginUrl);
					} else {
						handleError(req, resp, "Could not upload the image. Please try again later!");
					}
				} catch (IOException | ServletException e) {
					handleError(req, resp, "An error occurred while uploading the image. Please try again later!");
					e.printStackTrace(); // Log the exception
				}
			} else {
				handleError(req, resp, "Could not register your account. Please try again later!");
			}
		} catch (Exception e) {
			handleError(req, resp, "An unexpected error occurred. Please try again later!");
			e.printStackTrace(); // Log the exception
		}
	}

	/**
	 * Validates registration form by setting attributes.
	 * page.
	 *
	 * @param req         HttpServletRequest object
	 */
	private String validateRegistrationForm(HttpServletRequest req) {
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String username = req.getParameter("username");
		String dobStr = req.getParameter("dob");
		String gender = req.getParameter("gender");
		String email = req.getParameter("email");
		String number = req.getParameter("phoneNumber");
		String address = req.getParameter("address");
		String password = req.getParameter("password");
		String retypePassword = req.getParameter("retypePassword");

		// Check for null or empty fields first
		if (ValidationUtil.isNullOrEmpty(firstName)) {
			return "First name is required.";
		}
		if (ValidationUtil.isNullOrEmpty(lastName)) {
			return "Last name is required.";
		}
		if (ValidationUtil.isNullOrEmpty(username)) {
			return "Username is required.";
		}
		if (ValidationUtil.isNullOrEmpty(dobStr)) {
			return "Date of birth is required.";
		}
		if (ValidationUtil.isNullOrEmpty(gender)) {
			return "Gender is required.";
		}
		if (ValidationUtil.isNullOrEmpty(email)) {
			return "Email is required.";
		}
		if (ValidationUtil.isNullOrEmpty(number)) {
			return "Phone number is required.";
		}
		if (ValidationUtil.isNullOrEmpty(address)) {
			return "Address is required.";
		}
		if (ValidationUtil.isNullOrEmpty(password)) {
			return "Password is required.";
		}
		if (ValidationUtil.isNullOrEmpty(retypePassword)) {
			return "Please retype the password.";
		}

		// Convert date of birth
		LocalDate dob;
		try {
			dob = LocalDate.parse(dobStr);
		} catch (Exception e) {
			return "Invalid date format. Please use YYYY-MM-DD.";
		}

		// Validate fields
		if (!ValidationUtil.isAlphabetic(firstName)) {
			return "FirstName must contain letters only.";
		}
		if (!ValidationUtil.isAlphabetic(lastName)) {
			return "LastName must contain letters only.";
		}

		if (!ValidationUtil.isAlphanumericStartingWithLetter(username)) {
			return "Username must start with a letter and contain only letters and numbers.";
		}

		if (!ValidationUtil.isValidGender(gender)) {
			return "Gender must be 'male' or 'female'.";
		}
		if (!ValidationUtil.isValidEmail(email)) {
			return "Invalid email format.";
		}
		if (!ValidationUtil.isValidPhoneNumber(number)) {
			return "Phone number must be 10 digits and start with 98.";
		}
		if (!ValidationUtil.isValidPassword(password)) {
			return "Password must be at least 8 characters long, with 1 uppercase letter, 1 number, and 1 symbol.";
		}
		if (!ValidationUtil.doPasswordsMatch(password, retypePassword)) {
			return "Passwords do not match.";
		}

		// Check if the date of birth is at least 16 years before today
		if (!ValidationUtil.isAgeAtLeast16(dob)) {
			return "You must be at least 16 years old to register.";
		}

		try {
			Part image = req.getPart("image");
			if (!ValidationUtil.isValidImageExtension(image)) {
				return "Invalid image format. Only jpg, jpeg, png, and gif are allowed.";
			}
		} catch (IOException | ServletException e) {
			return "Error handling image file. Please ensure the file is valid.";
		}

		// Add duplicate checks
	    try {
	        String phoneNumber = req.getParameter("phoneNumber");

	        if (registerService.isUsernameExists(username)) {
	            return "Username already exists. Please choose a different username.";
	        }
	        if (registerService.isEmailExists(email)) {
	            return "Email already exists. Please use a different email address.";
	        }
	        if (registerService.isPhoneNumberExists(phoneNumber)) {
	            return "Phone number already exists. Please use a different phone number.";
	        }
	    } catch (SQLException e) {
	        return "Error checking user details. Please try again later.";
	    }

	    return null; // All validations passed
	}

	 /**
		 * Extracts user model by setting attributes.
		 * page.
		 *
		 * @param req         HttpServletRequest object
		 */
	private UserModel extractUserModel(HttpServletRequest req) throws Exception {
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String username = req.getParameter("username");
		LocalDate dob = LocalDate.parse(req.getParameter("dob"));
		String gender = req.getParameter("gender");
		String email = req.getParameter("email");
		String number = req.getParameter("phoneNumber");
		String address = req.getParameter("address");
		String password = req.getParameter("password");

		// Assuming password validation is already done in validateRegistrationForm
		password = PasswordUtil.encrypt(username, password);

		Part image = req.getPart("image");
		String imageUrl = imageUtil.getImageNameFromPart(image);

		AddressModel addressModel = new AddressModel(address);
		return new UserModel(firstName, lastName, username, dob, gender, email, number, password, addressModel,
				imageUrl);
	}

	/**
	 * Upload image by root path.
	 *
	 * @param req         HttpServletRequest object
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	private boolean uploadImage(HttpServletRequest req) throws IOException, ServletException {
	    Part image = req.getPart("image");
	    String rootPath = req.getServletContext().getRealPath("/");
	    return imageUtil.uploadImage(image, rootPath, "user");
	}

	private void handleSuccess(HttpServletRequest req, HttpServletResponse resp, String message, String redirectPage)
			throws ServletException, IOException {
		req.setAttribute("success", message);
		req.getRequestDispatcher(redirectPage).forward(req, resp);
	}

	private void handleError(HttpServletRequest req, HttpServletResponse resp, String message)
			throws ServletException, IOException {
		req.setAttribute("error", message);
		req.setAttribute("firstName", req.getParameter("firstName"));
		req.setAttribute("lastName", req.getParameter("lastName"));
		req.setAttribute("username", req.getParameter("username"));
		req.setAttribute("dob", req.getParameter("dob"));
		req.setAttribute("gender", req.getParameter("gender"));
		req.setAttribute("email", req.getParameter("email"));
		req.setAttribute("phoneNumber", req.getParameter("phoneNumber"));
		req.setAttribute("address", req.getParameter("address"));
		req.getRequestDispatcher(RedirectionUtil.registerUrl).forward(req, resp);
	}
}