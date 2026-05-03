<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Corexa Dashboard — Tech Store</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/userdashboard.css">
  <!-- Fallback inline for demo: Google Fonts loaded via CSS @import -->
</head>
<body>

  <!-- Grid texture overlay -->
  <div class="grid-overlay"></div>

  <div class="dashboard-wrapper">

    <!-- ═══════════════════════════ SIDEBAR ═══════════════════════════ -->
    <aside class="sidebar">
      <!-- Brand -->
      <div class="sidebar-brand">
        <a href="#" class="brand-logo">
          <div class="brand-icon">⚡</div>
          <div>
            <div class="brand-name">Corexa</div>
            <div class="brand-sub">Tech Store</div>
          </div>
        </a>
      </div>

      <!-- User -->
      <div class="sidebar-user">
        <div class="user-card">
          <div class="user-avatar">AK</div>
          <div class="user-info">
            <div class="user-name">Aakash K.</div>
            <div class="user-role">Pro Member</div>
          </div>
          <div class="user-status" title="Online"></div>
        </div>
      </div>

      <!-- Navigation -->
      <nav class="sidebar-nav">
        <div class="nav-section">
          <div class="nav-label">Overview</div>

          <a href="#" class="nav-item active">
            <span class="nav-icon">🏠</span> Dashboard
          </a>
          <a href="#" class="nav-item">
            <span class="nav-icon">📦</span> My Orders
            <span class="nav-badge">3</span>
          </a>
          <a href="#" class="nav-item">
            <span class="nav-icon">❤️</span> Wishlist
            <span class="nav-badge">7</span>
          </a>
          <a href="#" class="nav-item">
            <span class="nav-icon">🛒</span> Cart
            <span class="nav-badge">2</span>
          </a>
        </div>

        <div class="nav-section">
          <div class="nav-label">Shop</div>

          <a href="#" class="nav-item">
            <span class="nav-icon">🎮</span> Gaming Gear
          </a>
          <a href="#" class="nav-item">
            <span class="nav-icon">🖥️</span> Monitors
          </a>
          <a href="#" class="nav-item">
            <span class="nav-icon">🎧</span> Audio
          </a>
          <a href="#" class="nav-item">
            <span class="nav-icon">⌨️</span> Keyboards
          </a>
          <a href="#" class="nav-item">
            <span class="nav-icon">🖱️</span> Mice
          </a>
        </div>

        <div class="nav-section">
          <div class="nav-label">Account</div>

          <a href="#" class="nav-item">
            <span class="nav-icon">👤</span> Profile
          </a>
          <a href="#" class="nav-item">
            <span class="nav-icon">📍</span> Addresses
          </a>
          <a href="#" class="nav-item">
            <span class="nav-icon">💳</span> Payments
          </a>
          <a href="#" class="nav-item">
            <span class="nav-icon">🔔</span> Notifications
          </a>
          <a href="#" class="nav-item">
            <span class="nav-icon">⚙️</span> Settings
          </a>
        </div>
      </nav>

      <!-- Footer -->
      <div class="sidebar-footer">
        <button class="logout-btn">
          <span>⏻</span> Sign Out
        </button>
      </div>
    </aside>
    <!-- END SIDEBAR -->

    <!-- ═══════════════════════════ MAIN CONTENT ═══════════════════════════ -->
    <div class="main-content">

      <!-- ── TOP BAR ── -->
      <header class="topbar">
        <div class="topbar-title">Dashboard</div>
        <div class="search-bar">
          <span class="search-icon">🔍</span>
          <input type="text" placeholder="Search products, orders..." />
        </div>
        <div class="topbar-actions">
          <button class="topbar-btn" title="Notifications">
            🔔
            <span class="notif-dot"></span>
          </button>
          <button class="topbar-btn" title="Wishlist">❤️</button>
          <button class="topbar-btn" title="Cart">🛒</button>
          <button class="topbar-btn" title="Profile">👤</button>
        </div>
      </header>

      <!-- ── PAGE BODY ── -->
      <main class="page-body">

        <!-- ── HERO BANNER ── -->
        <section class="hero-banner fade-in">
          <div class="hero-content">
            <div class="hero-badge">
              <span class="hero-badge-dot"></span>
              Featured Product
            </div>
            <h1 class="hero-headline">Ultra Bass<br/>Headphone</h1>
            <p class="hero-sub">Powerful Sound, Deeper Bass. Professional-grade acoustics engineered for audiophiles.</p>
            <div class="hero-actions">
              <a href="#" class="btn-primary">🛒 Shop Now</a>
              <a href="#" class="btn-ghost">Learn More →</a>
            </div>
            <div class="hero-stats">
              <div>
                <div class="hero-stat-num">30%</div>
                <div class="hero-stat-label">Discount</div>
              </div>
              <div>
                <div class="hero-stat-num">4.9★</div>
                <div class="hero-stat-label">Rating</div>
              </div>
              <div>
                <div class="hero-stat-num">2.4K</div>
                <div class="hero-stat-label">Sold</div>
              </div>
            </div>
          </div>

          <!-- Headphone Image -->
          <div class="hero-product">
            <div class="product-glow-ring"></div>
            <!-- 
              Place the headphone image file (e.g. headphone.png) in your webapp root 
              or adjust the src path to match your project structure.
              For the demo, we use the product banner as a background reference.
            -->
            <img
              src="headphone.png"
              alt="Ultra Bass Headphone"
              onerror="this.style.fontSize='80px'; this.style.display='flex'; this.style.alignItems='center'; this.style.justifyContent='center'; this.outerHTML='<div style=\'font-size:90px;filter:drop-shadow(0 0 30px rgba(0,194,255,.35))\'>🎧</div>';"
            />
            <div class="product-tag">GET 30% OFF</div>
            <div class="product-tag-stock">⚡ Limited Stock</div>
          </div>
        </section>

        <!-- ── STATS CARDS ── -->
        <div class="stats-grid fade-in-d1">
          <div class="stat-card">
            <div class="stat-icon blue">📦</div>
            <div class="stat-value">12</div>
            <div class="stat-label">Total Orders</div>
            <span class="stat-change up">↑ 3 this month</span>
          </div>
          <div class="stat-card">
            <div class="stat-icon cyan">🚚</div>
            <div class="stat-value">3</div>
            <div class="stat-label">Active Shipments</div>
            <span class="stat-change up">↑ in transit</span>
          </div>
          <div class="stat-card">
            <div class="stat-icon teal">❤️</div>
            <div class="stat-value">7</div>
            <div class="stat-label">Wishlist Items</div>
            <span class="stat-change up">↑ 2 new</span>
          </div>
          <div class="stat-card">
            <div class="stat-icon purple">💸</div>
            <div class="stat-value">Rs.8.4K</div>
            <div class="stat-label">Total Saved</div>
            <span class="stat-change up">↑ 12%</span>
          </div>
        </div>

        <!-- ── BROWSE BY CATEGORY ── -->
        <section class="categories-section fade-in-d2">
          <div class="section-header">
            <div class="section-title">Browse By Category</div>
            <a href="#" class="view-all-link">View All →</a>
          </div>
          <div class="categories-grid">
            <a href="#" class="cat-card active">
              <div class="cat-icon-wrap">🌐</div>
              <div class="cat-label">All</div>
              <div class="cat-count">240+</div>
            </a>
            <a href="#" class="cat-card">
              <div class="cat-icon-wrap">🎮</div>
              <div class="cat-label">Gaming</div>
              <div class="cat-count">48</div>
            </a>
            <a href="#" class="cat-card">
              <div class="cat-icon-wrap">⌨️</div>
              <div class="cat-label">Keyboard</div>
              <div class="cat-count">32</div>
            </a>
            <a href="#" class="cat-card">
              <div class="cat-icon-wrap">🖱️</div>
              <div class="cat-label">Mouse</div>
              <div class="cat-count">26</div>
            </a>
            <a href="#" class="cat-card">
              <div class="cat-icon-wrap">🎧</div>
              <div class="cat-label">Headphones</div>
              <div class="cat-count">19</div>
            </a>
            <a href="#" class="cat-card">
              <div class="cat-icon-wrap">🖥️</div>
              <div class="cat-label">Monitor</div>
              <div class="cat-count">15</div>
            </a>
            <a href="#" class="cat-card">
              <div class="cat-icon-wrap">🔲</div>
              <div class="cat-label">Components</div>
              <div class="cat-count">60</div>
            </a>
            <a href="#" class="cat-card">
              <div class="cat-icon-wrap">💾</div>
              <div class="cat-label">Storage</div>
              <div class="cat-count">22</div>
            </a>
            <a href="#" class="cat-card">
              <div class="cat-icon-wrap">•••</div>
              <div class="cat-label">More</div>
              <div class="cat-count">+50</div>
            </a>
          </div>
        </section>

        <!-- ── NEW ARRIVALS PRODUCTS ── -->
        <section class="products-section fade-in-d3">
          <div class="section-header">
            <div class="section-title">New Arrivals</div>
            <a href="#" class="view-all-link">Shop All →</a>
          </div>
          <div class="products-grid">

            <!-- Product 1: Headphone (Featured) -->
            <div class="product-card">
              <div class="product-img-wrap">
                <img
                  src="headphone.png"
                  alt="Ultra Bass Headphone"
                  onerror="this.outerHTML='<div class=\'product-emoji\'>🎧</div>';"
                />
                <span class="product-badge sale">30% OFF</span>
                <div class="product-fav">♡</div>
              </div>
              <div class="product-info">
                <div class="product-name">Ultra Bass Headphone</div>
                <div class="product-brand">Corexa Audio</div>
                <div class="product-rating">
                  <span class="stars">★★★★★</span>
                  <span class="rating-num">4.9 (2.4k)</span>
                </div>
                <div class="product-price-row">
                  <div>
                    <span class="product-price">Rs.2,799</span>
                    <span class="product-price-old">Rs.3,999</span>
                  </div>
                  <button class="add-cart-btn">+</button>
                </div>
              </div>
            </div>

            <!-- Product 2 -->
            <div class="product-card">
              <div class="product-img-wrap">
                <div class="product-emoji">🖥️</div>
                <span class="product-badge new">NEW</span>
                <div class="product-fav">♡</div>
              </div>
              <div class="product-info">
                <div class="product-name">27" IPS Gaming Monitor</div>
                <div class="product-brand">ViewCore</div>
                <div class="product-rating">
                  <span class="stars">★★★★☆</span>
                  <span class="rating-num">4.7 (830)</span>
                </div>
                <div class="product-price-row">
                  <div>
                    <span class="product-price">Rs.18,499</span>
                  </div>
                  <button class="add-cart-btn">+</button>
                </div>
              </div>
            </div>

            <!-- Product 3 -->
            <div class="product-card">
              <div class="product-img-wrap">
                <div class="product-emoji">⌨️</div>
                <span class="product-badge">HOT</span>
                <div class="product-fav">♡</div>
              </div>
              <div class="product-info">
                <div class="product-name">Mech RGB TKL Keyboard</div>
                <div class="product-brand">KeyForge</div>
                <div class="product-rating">
                  <span class="stars">★★★★★</span>
                  <span class="rating-num">4.8 (1.1k)</span>
                </div>
                <div class="product-price-row">
                  <div>
                    <span class="product-price">Rs.4,299</span>
                    <span class="product-price-old">Rs.5,500</span>
                  </div>
                  <button class="add-cart-btn">+</button>
                </div>
              </div>
            </div>

            <!-- Product 4 -->
            <div class="product-card">
              <div class="product-img-wrap">
                <div class="product-emoji">🖱️</div>
                <div class="product-fav">♡</div>
              </div>
              <div class="product-info">
                <div class="product-name">Pro Wireless Gaming Mouse</div>
                <div class="product-brand">ClickMaster</div>
                <div class="product-rating">
                  <span class="stars">★★★★☆</span>
                  <span class="rating-num">4.6 (560)</span>
                </div>
                <div class="product-price-row">
                  <div>
                    <span class="product-price">Rs.3,199</span>
                    <span class="product-price-old">Rs.3,999</span>
                  </div>
                  <button class="add-cart-btn">+</button>
                </div>
              </div>
            </div>

          </div>
        </section>

        <!-- ── RECENT ORDERS TABLE ── -->
        <section class="orders-section fade-in-d4">
          <div class="section-header">
            <div class="section-title">Recent Orders</div>
            <a href="#" class="view-all-link">All Orders →</a>
          </div>
          <div class="table-card">
            <div class="table-header">
              <div class="table-title">Order History</div>
            </div>
            <table class="orders-table">
              <thead>
                <tr>
                  <th>Order ID</th>
                  <th>Product</th>
                  <th>Date</th>
                  <th>Amount</th>
                  <th>Status</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td><span class="order-id">#CX-00481</span></td>
                  <td>Ultra Bass Headphone</td>
                  <td>01 May 2026</td>
                  <td>Rs.2,799</td>
                  <td><span class="order-status shipped"><span class="status-dot"></span>Shipped</span></td>
                  <td><a href="#" style="color:var(--blue-electric);font-size:12px;">Track →</a></td>
                </tr>
                <tr>
                  <td><span class="order-id">#CX-00462</span></td>
                  <td>Mech RGB TKL Keyboard</td>
                  <td>24 Apr 2026</td>
                  <td>Rs.4,299</td>
                  <td><span class="order-status delivered"><span class="status-dot"></span>Delivered</span></td>
                  <td><a href="#" style="color:var(--blue-electric);font-size:12px;">Review →</a></td>
                </tr>
                <tr>
                  <td><span class="order-id">#CX-00447</span></td>
                  <td>27" IPS Gaming Monitor</td>
                  <td>15 Apr 2026</td>
                  <td>Rs.18,499</td>
                  <td><span class="order-status processing"><span class="status-dot"></span>Processing</span></td>
                  <td><a href="#" style="color:var(--blue-electric);font-size:12px;">Details →</a></td>
                </tr>
                <tr>
                  <td><span class="order-id">#CX-00430</span></td>
                  <td>Pro Wireless Gaming Mouse</td>
                  <td>09 Apr 2026</td>
                  <td>Rs.3,199</td>
                  <td><span class="order-status delivered"><span class="status-dot"></span>Delivered</span></td>
                  <td><a href="#" style="color:var(--blue-electric);font-size:12px;">Review →</a></td>
                </tr>
                <tr>
                  <td><span class="order-id">#CX-00418</span></td>
                  <td>USB-C Hub 7-in-1</td>
                  <td>28 Mar 2026</td>
                  <td>Rs.1,499</td>
                  <td><span class="order-status cancelled"><span class="status-dot"></span>Cancelled</span></td>
                  <td><a href="#" style="color:var(--blue-electric);font-size:12px;">Reorder →</a></td>
                </tr>
              </tbody>
            </table>
          </div>
        </section>

      </main>
    </div>
    <!-- END MAIN CONTENT -->

  </div><!-- END WRAPPER -->

  <script>
    // ── ACTIVE NAV HIGHLIGHT ──
    document.querySelectorAll('.nav-item').forEach(item => {
      item.addEventListener('click', function(e) {
        e.preventDefault();
        document.querySelectorAll('.nav-item').forEach(i => i.classList.remove('active'));
        this.classList.add('active');
      });
    });

    // ── ACTIVE CATEGORY ──
    document.querySelectorAll('.cat-card').forEach(card => {
      card.addEventListener('click', function(e) {
        e.preventDefault();
        document.querySelectorAll('.cat-card').forEach(c => c.classList.remove('active'));
        this.classList.add('active');
      });
    });

    // ── WISHLIST TOGGLE ──
    document.querySelectorAll('.product-fav').forEach(btn => {
      btn.addEventListener('click', function(e) {
        e.stopPropagation();
        if (this.textContent === '♡') {
          this.textContent = '❤️';
          this.style.borderColor = '#ff6b9d';
        } else {
          this.textContent = '♡';
          this.style.borderColor = '';
        }
      });
    });

    // ── CART BUTTON FEEDBACK ──
    document.querySelectorAll('.add-cart-btn').forEach(btn => {
      btn.addEventListener('click', function(e) {
        e.stopPropagation();
        const orig = this.textContent;
        this.textContent = '✓';
        this.style.background = 'linear-gradient(135deg, #00c86e, #00ff88)';
        setTimeout(() => {
          this.textContent = orig;
          this.style.background = '';
        }, 1200);
      });
    });

    // ── SEARCH BAR FOCUS ──
    const searchInput = document.querySelector('.search-bar input');
    searchInput.addEventListener('focus', function() {
      this.parentElement.style.boxShadow = '0 0 0 2px rgba(0,194,255,0.15)';
    });
    searchInput.addEventListener('blur', function() {
      this.parentElement.style.boxShadow = '';
    });
  </script>

</body>
</html>
