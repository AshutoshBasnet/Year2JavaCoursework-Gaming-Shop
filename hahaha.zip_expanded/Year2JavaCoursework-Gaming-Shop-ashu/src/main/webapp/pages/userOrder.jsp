<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>My Orders — COREXA Tech Store</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/shared.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/userOrder.css">
</head>
<body>
  <div class="grid-overlay"></div>
  <div class="dashboard-wrapper">

    <!-- SIDEBAR -->
    <aside class="sidebar">
      <div class="sidebar-brand">
        <a href="dashboard.html" class="brand-logo">
          <div class="brand-icon">⚡</div>
          <div>
            <div class="brand-name">COREXA</div>
            <div class="brand-sub">Tech Store</div>
          </div>
        </a>
      </div>
      <div class="sidebar-user">
        <div class="user-card">
          <div class="user-avatar">AK</div>
          <div class="user-info">
            <div class="user-name">Aakash K.</div>
            <div class="user-role">Pro Member</div>
          </div>
          <div class="user-status"></div>
        </div>
      </div>
      <nav class="sidebar-nav">
        <div class="nav-section">
          <div class="nav-label">Overview</div>
          <a href="dashboard.html" class="nav-item"><span class="nav-icon">🏠</span> Dashboard</a>
          <a href="orders.html" class="nav-item active"><span class="nav-icon">📦</span> My Orders <span class="nav-badge">5</span></a>
          <a href="wishlist.html" class="nav-item"><span class="nav-icon">❤️</span> Wishlist <span class="nav-badge">7</span></a>
          <a href="cart.html" class="nav-item"><span class="nav-icon">🛒</span> Cart <span class="nav-badge">2</span></a>
        </div>
        <div class="nav-section">
          <div class="nav-label">Shop</div>
          <a href="#" class="nav-item"><span class="nav-icon">🎮</span> Gaming Gear</a>
          <a href="#" class="nav-item"><span class="nav-icon">🖥️</span> Monitors</a>
          <a href="#" class="nav-item"><span class="nav-icon">🎧</span> Audio</a>
          <a href="#" class="nav-item"><span class="nav-icon">⌨️</span> Keyboards</a>
          <a href="#" class="nav-item"><span class="nav-icon">🖱️</span> Mice</a>
        </div>
        <div class="nav-section">
          <div class="nav-label">Account</div>
          <a href="#" class="nav-item"><span class="nav-icon">👤</span> Profile</a>
          <a href="#" class="nav-item"><span class="nav-icon">📍</span> Addresses</a>
          <a href="#" class="nav-item"><span class="nav-icon">💳</span> Payments</a>
          <a href="#" class="nav-item"><span class="nav-icon">🔔</span> Notifications</a>
          <a href="#" class="nav-item"><span class="nav-icon">⚙️</span> Settings</a>
        </div>
      </nav>
      <div class="sidebar-footer">
        <button class="logout-btn"><span>⏻</span> Sign Out</button>
      </div>
    </aside>

    <!-- MAIN CONTENT -->
    <div class="main-content">
      <header class="topbar">
        <div class="topbar-title">My Orders</div>
        <div class="topbar-breadcrumb">
          <a href="dashboard.html">Home</a>
          <span>/</span>
          <span>Orders</span>
        </div>
        <div class="search-bar">
          <span class="search-icon">🔍</span>
          <input type="text" placeholder="Search orders by ID or product..." />
        </div>
        <div class="topbar-actions">
          <button class="topbar-btn">🔔<span class="notif-dot"></span></button>
          <button class="topbar-btn">❤️</button>
          <button class="topbar-btn">🛒</button>
          <button class="topbar-btn">👤</button>
        </div>
      </header>

      <main class="page-body">

        <!-- PAGE HEADER -->
        <div class="page-header fade-in">
          <h1 class="page-heading">My Orders</h1>
          <p class="page-sub">Track, manage and review all your purchases.</p>
        </div>

        <!-- SUMMARY PANEL -->
        <div class="order-summary-panel fade-in-d1">
          <div class="summary-stat">
            <div class="summary-stat-val">12</div>
            <div class="summary-stat-label">Total Orders</div>
          </div>
          <div class="summary-divider"></div>
          <div class="summary-stat">
            <div class="summary-stat-val" style="color:#00dc78;">8</div>
            <div class="summary-stat-label">Delivered</div>
          </div>
          <div class="summary-divider"></div>
          <div class="summary-stat">
            <div class="summary-stat-val" style="color:var(--blue-electric);">3</div>
            <div class="summary-stat-label">In Progress</div>
          </div>
          <div class="summary-divider"></div>
          <div class="summary-stat">
            <div class="summary-stat-val" style="color:#ff5050;">1</div>
            <div class="summary-stat-label">Cancelled</div>
          </div>
        </div>

        <!-- FILTER BAR -->
        <div class="filter-bar fade-in-d2">
          <div class="filter-tabs">
            <button class="filter-tab active" onclick="setFilter(this,'all')">All Orders</button>
            <button class="filter-tab" onclick="setFilter(this,'shipped')">Shipped</button>
            <button class="filter-tab" onclick="setFilter(this,'delivered')">Delivered</button>
            <button class="filter-tab" onclick="setFilter(this,'processing')">Processing</button>
            <button class="filter-tab" onclick="setFilter(this,'cancelled')">Cancelled</button>
          </div>
          <div class="filter-spacer"></div>
          <select class="filter-select">
            <option>Sort: Latest First</option>
            <option>Sort: Oldest First</option>
            <option>Sort: High to Low</option>
            <option>Sort: Low to High</option>
          </select>
        </div>

        <!-- ORDERS LIST -->
        <div class="orders-list fade-in-d3" id="orders-list">

          <!-- ORDER 1: SHIPPED -->
          <div class="order-card" data-status="shipped">
            <div class="order-card-header">
              <div class="order-meta">
                <span class="order-id-tag">#ONZ-00481</span>
                <span class="order-date-tag">📅 01 May 2026</span>
                <span class="order-date-tag">📦 2 items</span>
              </div>
              <span class="order-status-badge shipped"><span class="status-dot"></span> Shipped</span>
            </div>

            <!-- Tracking -->
            <div class="tracking-section">
              <div class="tracking-label">📡 Order Tracking</div>
              <div class="tracking-steps">
                <div class="tracking-progress-bar" style="width: 62%;"></div>
                <div class="tracking-step">
                  <div class="step-dot done">✓</div>
                  <div class="step-name">Ordered</div>
                </div>
                <div class="tracking-step">
                  <div class="step-dot done">✓</div>
                  <div class="step-name">Confirmed</div>
                </div>
                <div class="tracking-step">
                  <div class="step-dot done">✓</div>
                  <div class="step-name">Packed</div>
                </div>
                <div class="tracking-step">
                  <div class="step-dot current">🚚</div>
                  <div class="step-name">In Transit</div>
                </div>
                <div class="tracking-step">
                  <div class="step-dot">🏠</div>
                  <div class="step-name">Delivered</div>
                </div>
              </div>
            </div>

            <div class="order-card-body">
              <div class="order-items">
                <div class="order-item">
                  <div class="order-item-img">🎧</div>
                  <div class="order-item-details">
                    <div class="order-item-name">Ultra Bass Headphone — Pro Edition</div>
                    <div class="order-item-meta">
                      <span>Color: Matte Black</span>
                      <span class="order-item-qty">Qty: 1</span>
                    </div>
                  </div>
                  <div class="order-item-price">Rs.2,799</div>
                </div>
                <div class="order-item">
                  <div class="order-item-img">🔌</div>
                  <div class="order-item-details">
                    <div class="order-item-name">USB-C Braided Cable 2m</div>
                    <div class="order-item-meta">
                      <span>Color: Black</span>
                      <span class="order-item-qty">Qty: 2</span>
                    </div>
                  </div>
                  <div class="order-item-price">Rs.498</div>
                </div>
              </div>
            </div>

            <div class="order-card-footer">
              <div class="order-total-wrap">
                <span class="order-total-label">Total:</span>
                <span class="order-total-amount">Rs.3,297</span>
              </div>
              <div class="order-actions">
                <button class="action-btn">📞 Support</button>
                <button class="action-btn">📄 Invoice</button>
                <button class="action-btn primary">📡 Track Order</button>
              </div>
            </div>
          </div>

          <!-- ORDER 2: DELIVERED -->
          <div class="order-card" data-status="delivered">
            <div class="order-card-header">
              <div class="order-meta">
                <span class="order-id-tag">#ONZ-00462</span>
                <span class="order-date-tag">📅 24 Apr 2026</span>
                <span class="order-date-tag">📦 1 item</span>
              </div>
              <span class="order-status-badge delivered"><span class="status-dot"></span> Delivered</span>
            </div>

            <div class="order-card-body">
              <div class="order-items">
                <div class="order-item">
                  <div class="order-item-img">⌨️</div>
                  <div class="order-item-details">
                    <div class="order-item-name">Mech RGB TKL Keyboard — Red Switch</div>
                    <div class="order-item-meta">
                      <span>Switch: Red Linear</span>
                      <span class="order-item-qty">Qty: 1</span>
                    </div>
                  </div>
                  <div class="order-item-price">Rs.4,299</div>
                </div>
              </div>
            </div>

            <div class="order-card-footer">
              <div class="order-total-wrap">
                <span class="order-total-label">Total:</span>
                <span class="order-total-amount">Rs.4,299</span>
              </div>
              <div class="order-actions">
                <button class="action-btn">🔄 Reorder</button>
                <button class="action-btn">📄 Invoice</button>
                <button class="action-btn primary">⭐ Write Review</button>
              </div>
            </div>
          </div>

          <!-- ORDER 3: PROCESSING -->
          <div class="order-card" data-status="processing">
            <div class="order-card-header">
              <div class="order-meta">
                <span class="order-id-tag">#ONZ-00447</span>
                <span class="order-date-tag">📅 15 Apr 2026</span>
                <span class="order-date-tag">📦 1 item</span>
              </div>
              <span class="order-status-badge processing"><span class="status-dot"></span> Processing</span>
            </div>

            <!-- Tracking -->
            <div class="tracking-section">
              <div class="tracking-label">📡 Order Tracking</div>
              <div class="tracking-steps">
                <div class="tracking-progress-bar" style="width: 28%;"></div>
                <div class="tracking-step">
                  <div class="step-dot done">✓</div>
                  <div class="step-name">Ordered</div>
                </div>
                <div class="tracking-step">
                  <div class="step-dot current">⚙️</div>
                  <div class="step-name">Confirmed</div>
                </div>
                <div class="tracking-step">
                  <div class="step-dot">📦</div>
                  <div class="step-name">Packed</div>
                </div>
                <div class="tracking-step">
                  <div class="step-dot">🚚</div>
                  <div class="step-name">In Transit</div>
                </div>
                <div class="tracking-step">
                  <div class="step-dot">🏠</div>
                  <div class="step-name">Delivered</div>
                </div>
              </div>
            </div>

            <div class="order-card-body">
              <div class="order-items">
                <div class="order-item">
                  <div class="order-item-img">🖥️</div>
                  <div class="order-item-details">
                    <div class="order-item-name">27" IPS 165Hz Gaming Monitor</div>
                    <div class="order-item-meta">
                      <span>Resolution: 2K QHD</span>
                      <span class="order-item-qty">Qty: 1</span>
                    </div>
                  </div>
                  <div class="order-item-price">Rs.18,499</div>
                </div>
              </div>
            </div>

            <div class="order-card-footer">
              <div class="order-total-wrap">
                <span class="order-total-label">Total:</span>
                <span class="order-total-amount">Rs.18,499</span>
              </div>
              <div class="order-actions">
                <button class="action-btn btn-danger">✕ Cancel Order</button>
                <button class="action-btn">📄 Invoice</button>
                <button class="action-btn primary">📋 View Details</button>
              </div>
            </div>
          </div>

          <!-- ORDER 4: DELIVERED -->
          <div class="order-card" data-status="delivered">
            <div class="order-card-header">
              <div class="order-meta">
                <span class="order-id-tag">#ONZ-00430</span>
                <span class="order-date-tag">📅 09 Apr 2026</span>
                <span class="order-date-tag">📦 1 item</span>
              </div>
              <span class="order-status-badge delivered"><span class="status-dot"></span> Delivered</span>
            </div>
            <div class="order-card-body">
              <div class="order-items">
                <div class="order-item">
                  <div class="order-item-img">🖱️</div>
                  <div class="order-item-details">
                    <div class="order-item-name">Pro Wireless Gaming Mouse — 25600 DPI</div>
                    <div class="order-item-meta">
                      <span>Color: Midnight Black</span>
                      <span class="order-item-qty">Qty: 1</span>
                    </div>
                  </div>
                  <div class="order-item-price">Rs.3,199</div>
                </div>
              </div>
            </div>
            <div class="order-card-footer">
              <div class="order-total-wrap">
                <span class="order-total-label">Total:</span>
                <span class="order-total-amount">Rs.3,199</span>
              </div>
              <div class="order-actions">
                <button class="action-btn">🔄 Reorder</button>
                <button class="action-btn">📄 Invoice</button>
                <button class="action-btn primary">⭐ Write Review</button>
              </div>
            </div>
          </div>

          <!-- ORDER 5: CANCELLED -->
          <div class="order-card" data-status="cancelled">
            <div class="order-card-header">
              <div class="order-meta">
                <span class="order-id-tag">#ONZ-00418</span>
                <span class="order-date-tag">📅 28 Mar 2026</span>
                <span class="order-date-tag">📦 1 item</span>
              </div>
              <span class="order-status-badge cancelled"><span class="status-dot"></span> Cancelled</span>
            </div>
            <div class="order-card-body">
              <div class="order-items">
                <div class="order-item">
                  <div class="order-item-img" style="opacity:0.5;">🔌</div>
                  <div class="order-item-details" style="opacity:0.6;">
                    <div class="order-item-name">USB-C Hub 7-in-1 — Space Grey</div>
                    <div class="order-item-meta">
                      <span>Ports: USB3.0 × 3, HDMI, SD</span>
                      <span class="order-item-qty">Qty: 1</span>
                    </div>
                  </div>
                  <div class="order-item-price" style="opacity:0.5; text-decoration:line-through;">Rs.1,499</div>
                </div>
              </div>
            </div>
            <div class="order-card-footer">
              <div class="order-total-wrap">
                <span class="order-total-label">Refund:</span>
                <span class="order-total-amount" style="color:#00dc78;">Rs.1,499</span>
              </div>
              <div class="order-actions">
                <button class="action-btn">💬 Contact Us</button>
                <button class="action-btn primary">🔄 Reorder</button>
              </div>
            </div>
          </div>

        </div><!-- end orders-list -->
      </main>
    </div>
  </div>

  <script>
    function setFilter(btn, status) {
      document.querySelectorAll('.filter-tab').forEach(t => t.classList.remove('active'));
      btn.classList.add('active');
      const cards = document.querySelectorAll('.order-card');
      cards.forEach(card => {
        if (status === 'all' || card.dataset.status === status) {
          card.style.display = '';
        } else {
          card.style.display = 'none';
        }
      });
    }

    // Nav active state
    document.querySelectorAll('.nav-item').forEach(item => {
      item.addEventListener('click', function(e) {
        if (!this.getAttribute('href') || this.getAttribute('href') === '#') e.preventDefault();
        document.querySelectorAll('.nav-item').forEach(i => i.classList.remove('active'));
        this.classList.add('active');
      });
    });
  </script>
</body>
</html>

