<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Cart — Corexa Tech Store</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/shared.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/cart.css">
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
            <div class="brand-name">Corexa</div>
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
          <a href="orders.html" class="nav-item"><span class="nav-icon">📦</span> My Orders <span class="nav-badge">5</span></a>
          <a href="wishlist.html" class="nav-item"><span class="nav-icon">❤️</span> Wishlist <span class="nav-badge">7</span></a>
          <a href="cart.html" class="nav-item active"><span class="nav-icon">🛒</span> Cart <span class="nav-badge">2</span></a>
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
        <div class="topbar-title">Cart</div>
        <div class="topbar-breadcrumb">
          <a href="dashboard.html">Home</a><span>/</span><span>Cart</span>
        </div>
        <div class="search-bar">
          <span class="search-icon">🔍</span>
          <input type="text" placeholder="Search products..." />
        </div>
        <div class="topbar-actions">
          <button class="topbar-btn">🔔<span class="notif-dot"></span></button>
          <button class="topbar-btn">❤️</button>
          <button class="topbar-btn" style="border-color:var(--blue-electric); color:var(--blue-electric);">🛒</button>
          <button class="topbar-btn">👤</button>
        </div>
      </header>

      <main class="page-body">

        <div class="page-header fade-in">
          <h1 class="page-heading">Shopping Cart</h1>
          <p class="page-sub">Review your items and proceed to checkout.</p>
        </div>

        <div class="cart-layout fade-in-d1">

          <!-- LEFT: CART ITEMS -->
          <div>
            <div class="cart-panel">
              <div class="cart-panel-header">
                <div style="display:flex; align-items:center; gap:12px;">
                  <span class="cart-panel-title">Cart Items</span>
                  <span class="cart-count-badge" id="cart-count">2 Items</span>
                </div>
                <button class="clear-cart-btn" onclick="clearCart()">🗑 Clear All</button>
              </div>

              <div class="cart-items" id="cart-items">

                <!-- ITEM 1 -->
                <div class="cart-item" id="item-1">
                  <div class="cart-item-img">🎧</div>
                  <div class="cart-item-info">
                    <div class="cart-item-name">Ultra Bass Headphone — Pro Edition</div>
                    <div class="cart-item-meta">
                      <span>🎨 Matte Black</span>
                      <span>📦 In Stock</span>
                      <span>🚚 Free Delivery</span>
                    </div>
                    <div class="qty-control">
                      <button class="qty-btn" onclick="changeQty('item-1', -1)">−</button>
                      <div class="qty-value" id="qty-item-1">1</div>
                      <button class="qty-btn" onclick="changeQty('item-1', +1)">+</button>
                    </div>
                  </div>
                  <div class="cart-item-price-col">
                    <div class="cart-item-unit-price">Rs.2,799 each</div>
                    <div class="cart-item-total-price" id="price-item-1">Rs.2,799</div>
                    <div class="cart-item-savings">You save Rs.1,200!</div>
                  </div>
                  <button class="cart-remove-btn" onclick="removeItem('item-1')">✕</button>
                </div>

                <!-- ITEM 2 -->
                <div class="cart-item" id="item-2">
                  <div class="cart-item-img">⌨️</div>
                  <div class="cart-item-info">
                    <div class="cart-item-name">Mech RGB TKL Keyboard — Red Switch</div>
                    <div class="cart-item-meta">
                      <span>🔴 Red Linear Switch</span>
                      <span>📦 In Stock</span>
                      <span>🚚 Free Delivery</span>
                    </div>
                    <div class="qty-control">
                      <button class="qty-btn" onclick="changeQty('item-2', -1)">−</button>
                      <div class="qty-value" id="qty-item-2">1</div>
                      <button class="qty-btn" onclick="changeQty('item-2', +1)">+</button>
                    </div>
                  </div>
                  <div class="cart-item-price-col">
                    <div class="cart-item-unit-price">Rs.4,299 each</div>
                    <div class="cart-item-total-price" id="price-item-2">Rs.4,299</div>
                    <div class="cart-item-savings">You save Rs.1,201!</div>
                  </div>
                  <button class="cart-remove-btn" onclick="removeItem('item-2')">✕</button>
                </div>

              </div>

              <!-- PROMO CODE -->
              <div class="promo-section">
                <div class="promo-input-row">
                  <input class="promo-input" id="promo-input" type="text" placeholder="Enter promo code" />
                  <button class="promo-apply-btn" onclick="applyPromo()">Apply</button>
                </div>
                <div class="promo-hint">Try code <strong style="color:var(--blue-electric);">COREXA10</strong> for 10% off!</div>
                <div class="promo-success" id="promo-success">✅ Promo applied! You saved Rs.709.</div>
              </div>
            </div>

            <!-- ALSO BOUGHT -->
            <div class="also-bought fade-in-d2">
              <div class="section-header">
                <div class="section-title">Frequently Bought Together</div>
              </div>
              <div class="mini-product-grid">
                <div class="mini-product-card">
                  <div class="mini-product-emoji">🖱️</div>
                  <div class="mini-product-name">Pro Gaming Mouse</div>
                  <div class="mini-product-price">Rs.3,199</div>
                  <button class="mini-add-btn" onclick="this.textContent='✓ Added'; this.style.color='#00dc78'">+ Add</button>
                </div>
                <div class="mini-product-card">
                  <div class="mini-product-emoji">🖥️</div>
                  <div class="mini-product-name">27" Gaming Monitor</div>
                  <div class="mini-product-price">Rs.18,499</div>
                  <button class="mini-add-btn" onclick="this.textContent='✓ Added'; this.style.color='#00dc78'">+ Add</button>
                </div>
                <div class="mini-product-card">
                  <div class="mini-product-emoji">🔌</div>
                  <div class="mini-product-name">USB-C Hub 7-in-1</div>
                  <div class="mini-product-price">Rs.1,499</div>
                  <button class="mini-add-btn" onclick="this.textContent='✓ Added'; this.style.color='#00dc78'">+ Add</button>
                </div>
              </div>
            </div>
          </div>

          <!-- RIGHT: ORDER SUMMARY -->
          <div>
            <div class="order-summary-card fade-in-d2">
              <div class="summary-header">
                <div class="summary-title">Order Summary</div>
              </div>
              <div class="summary-body">
                <div class="summary-row">
                  <span class="summary-row-label">Subtotal (2 items)</span>
                  <span class="summary-row-val" id="summary-subtotal">Rs.7,098</span>
                </div>
                <div class="summary-row">
                  <span class="summary-row-label">Discount</span>
                  <span class="summary-row-val green">− Rs.2,401</span>
                </div>
                <div class="summary-row">
                  <span class="summary-row-label">Promo Code</span>
                  <span class="summary-row-val red" id="promo-row">Not applied</span>
                </div>
                <div class="summary-row">
                  <span class="summary-row-label">Delivery</span>
                  <span class="summary-row-val green">FREE</span>
                </div>
                <div class="summary-row">
                  <span class="summary-row-label">Tax (13% VAT)</span>
                  <span class="summary-row-val cyan" id="summary-tax">Rs.923</span>
                </div>

                <div class="summary-divider-line"></div>

                <div class="summary-total-row">
                  <span class="summary-total-label">Total</span>
                  <span class="summary-total-val" id="summary-total">Rs.8,021</span>
                </div>

                <button class="checkout-btn" onclick="this.textContent='⚡ PROCESSING...'; setTimeout(()=>this.textContent='🔒 PROCEED TO CHECKOUT', 1500)">
                  🔒 PROCEED TO CHECKOUT
                </button>
                <a href="dashboard.html" class="continue-shopping">← Continue Shopping</a>

                <div class="payment-icons">
                  <span class="pay-icon">VISA</span>
                  <span class="pay-icon">MC</span>
                  <span class="pay-icon">UPI</span>
                  <span class="pay-icon">COD</span>
                </div>
                <div class="secure-badge">🔒 Secured by 256-bit SSL Encryption</div>
              </div>
            </div>
          </div>
        </div>

      </main>
    </div>
  </div>

  <script>
    const prices = { 'item-1': 2799, 'item-2': 4299 };
    const qtys   = { 'item-1': 1, 'item-2': 1 };
    let promoApplied = false;

    function fmt(n) { return 'Rs.' + n.toLocaleString('en-IN'); }

    function updateSummary() {
      let sub = 0, count = 0;
      for (const id in qtys) {
        const el = document.getElementById(id);
        if (el && el.style.display !== 'none') {
          sub += prices[id] * qtys[id];
          count += qtys[id];
        }
      }
      const tax = Math.round(sub * 0.13);
      const promo = promoApplied ? Math.round(sub * 0.1) : 0;
      const total = sub + tax - promo;
      document.getElementById('summary-subtotal').textContent = fmt(sub);
      document.getElementById('summary-tax').textContent = fmt(tax);
      document.getElementById('summary-total').textContent = fmt(total);
      document.getElementById('cart-count').textContent = count + ' Item' + (count !== 1 ? 's' : '');
      document.getElementById('promo-row').textContent = promoApplied ? '− ' + fmt(promo) : 'Not applied';
      document.getElementById('promo-row').style.color = promoApplied ? '#00dc78' : '#ff5050';
    }

    function changeQty(id, delta) {
      qtys[id] = Math.max(1, (qtys[id] || 1) + delta);
      document.getElementById('qty-' + id).textContent = qtys[id];
      document.getElementById('price-' + id).textContent = fmt(prices[id] * qtys[id]);
      updateSummary();
    }

    function removeItem(id) {
      const el = document.getElementById(id);
      el.style.opacity = '0';
      el.style.transform = 'translateX(30px)';
      el.style.transition = 'all 0.3s ease';
      setTimeout(() => { el.style.display = 'none'; updateSummary(); }, 300);
    }

    function clearCart() {
      ['item-1', 'item-2'].forEach(id => removeItem(id));
    }

    function applyPromo() {
      const code = document.getElementById('promo-input').value.trim().toUpperCase();
      if (code === 'COREXA10') {
        promoApplied = true;
        document.getElementById('promo-success').style.display = 'block';
        updateSummary();
      } else {
        document.getElementById('promo-success').style.display = 'none';
        document.getElementById('promo-success').style.color = '#ff5050';
        document.getElementById('promo-success').textContent = '❌ Invalid promo code.';
        document.getElementById('promo-success').style.display = 'block';
      }
    }
  </script>
</body>
</html>
