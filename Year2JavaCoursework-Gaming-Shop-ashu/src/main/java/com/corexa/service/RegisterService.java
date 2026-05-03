
package com.corexa.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.corexa.config.DbConfig;
import com.corexa.model.UserModel;

/**
 * RegisterService handles the registration of new users. It manages database
 * interactions for user registration.
 */
public class RegisterService {

	private Connection dbConn;

	/**
	 * Constructor initializes the database connection.
	 */
	public RegisterService() {
		try {
			this.dbConn = DbConfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			System.err.println("Database connection error: " + ex.getMessage());
			ex.printStackTrace();
		}
	}

	/**
	 * Registers a new user in the database.
	 *
	 * @param userModel the user details to be registered
	 * @return Boolean indicating the success of the operation
	 */
	public Boolean addUser(UserModel userModel) {
        if (dbConn == null) {
            System.err.println("Database connection is not available.");
            return null;
        }

        try {
            // Check for duplicates
            if (isUsernameExists(userModel.getUserName())) {
                throw new SQLException("Username already exists");
            }
            if (isEmailExists(userModel.getEmail())) {
                throw new SQLException("Email already exists");
            }
            if (isPhoneNumberExists(userModel.getNumber())) {
                throw new SQLException("Phone number already exists");
            }

            // Rest of the existing addUser logic...
            String addressQuery = "SELECT address_id FROM address WHERE name = ?";
            String insertQuery = "INSERT INTO user (first_name, last_name, username, dob, gender, email, number, password, address_id, profilePic) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            try (PreparedStatement addressStmt = dbConn.prepareStatement(addressQuery);
                    PreparedStatement insertStmt = dbConn.prepareStatement(insertQuery)) {

                // Fetch address ID
                addressStmt.setString(1, userModel.getAddress().getName());
                ResultSet result = addressStmt.executeQuery();
                int addressId = result.next() ? result.getInt("address_id") : 1;

                // Insert user details
                insertStmt.setString(1, userModel.getFirstName());
                insertStmt.setString(2, userModel.getLastName());
                insertStmt.setString(3, userModel.getUserName());
                insertStmt.setDate(4, Date.valueOf(userModel.getDob()));
                insertStmt.setString(5, userModel.getGender());
                insertStmt.setString(6, userModel.getEmail());
                insertStmt.setString(7, userModel.getNumber());
                insertStmt.setString(8, userModel.getPassword());
                insertStmt.setInt(9, addressId);
                insertStmt.setString(10, userModel.getImageUrl());

                return insertStmt.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            System.err.println("Error during user registration: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

	 /**
     * Checks if username already exists in the database
     */
    public boolean isUsernameExists(String username) throws SQLException {
        String query = "SELECT COUNT(*) FROM user WHERE username = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            return rs.next() && rs.getInt(1) > 0;
        }
    }

    /**
     * Checks if email already exists in the database
     */
    public boolean isEmailExists(String email) throws SQLException {
        String query = "SELECT COUNT(*) FROM user WHERE email = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            return rs.next() && rs.getInt(1) > 0;
        }
    }

    /**
     * Checks if phone number already exists in the database
     */
    public boolean isPhoneNumberExists(String number) throws SQLException {
        String query = "SELECT COUNT(*) FROM user WHERE number = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, number);
            ResultSet rs = stmt.executeQuery();
            return rs.next() && rs.getInt(1) > 0;
        }
    }

}
