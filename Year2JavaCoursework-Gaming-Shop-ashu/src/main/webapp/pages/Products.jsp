<%@ page isELIgnored="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Corexa — Products</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/Style.css">
<style>
.product-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 18px; }
.product-card {
  background: var(--navy-card);
  border: 1px solid var(--border);
  border-radius: var(--radius);
  overflow: hidden;
  transition: transform .2s, box-shadow .2s;
  cursor: pointer;
}
.product-card:hover { transform: translateY(-3px); box-shadow: 0 14px 40px rgba(0,0,0,0.4); }
.product-img {
  height: 130px;
  display: flex; align-items: center; justify-content: center;
  font-size: 52px;
  position: relative;
}
.product-body { padding: 16px; }
.product-name { font-family: var(--font-display); font-size: .95rem; font-weight: 600; color: var(--white); margin-bottom: 4px; }
.product-cat { font-size: .72rem; color: var(--text-muted); margin-bottom: 12px; }
.product-price { font-family: var(--font-display); font-size: 1.2rem; font-weight: 700; color: var(--accent); }
.product-stock { font-size: .72rem; }
.product-footer { padding: 12px 16px; border-top: 1px solid var(--border); display: flex; align-items: center; justify-content: space-between; }
.stock-bar-wrap { flex: 1; }
.view-toggle { display: flex; gap: 4px; background: var(--navy-card); border: 1px solid var(--border); padding: 4px; border-radius: 8px; }
.view-btn { padding: 5px 10px; border-radius: 6px; cursor: pointer; border: none; background: transparent; color: var(--text-muted); transition: all .15s; }
.view-btn.active { background: var(--accent); color: #fff; }
</style>
</head>
<body>

<div id="sidebar-root"></div>

<main class="main">
  <header class="topbar">
    <div class="page-title-group">
      <h1>Products</h1>
      <p>Manage your gaming store inventory</p>
    </div>
    <div class="topbar-actions">
      <div class="topbar-search">
        <svg width="14" height="14" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
        <input type="text" placeholder="Search products…" id="searchInput" />
      </div>
      <select id="catFilter">
        <option value="">All Categories</option>
        <option value="Controllers">Controllers</option>
        <option value="Audio">Audio</option>
        <option value="Accessories">Accessories</option>
        <option value="Keyboards">Keyboards</option>
        <option value="Mice">Mice</option>
        <option value="Monitors">Monitors</option>
      </select>
      <div class="view-toggle">
        <button class="view-btn active" onclick="setView('grid', this)">
          <svg width="13" height="13" fill="currentColor" viewBox="0 0 16 16"><path d="M1 2.5A1.5 1.5 0 012.5 1h3A1.5 1.5 0 017 2.5v3A1.5 1.5 0 015.5 7h-3A1.5 1.5 0 011 5.5v-3zm8 0A1.5 1.5 0 0110.5 1h3A1.5 1.5 0 0115 2.5v3A1.5 1.5 0 0113.5 7h-3A1.5 1.5 0 018 5.5v-3zm-8 8A1.5 1.5 0 012.5 9h3A1.5 1.5 0 017 10.5v3A1.5 1.5 0 015.5 15h-3A1.5 1.5 0 011 13.5v-3zm8 0A1.5 1.5 0 0110.5 9h3A1.5 1.5 0 0115 10.5v3A1.5 1.5 0 0113.5 15h-3A1.5 1.5 0 018 13.5v-3z"/></svg>
        </button>
        <button class="view-btn" onclick="setView('list', this)">
          <svg width="13" height="13" fill="currentColor" viewBox="0 0 16 16"><path d="M2.5 12a.5.5 0 01.5-.5h10a.5.5 0 010 1H3a.5.5 0 01-.5-.5zm0-4a.5.5 0 01.5-.5h10a.5.5 0 010 1H3a.5.5 0 01-.5-.5zm0-4a.5.5 0 01.5-.5h10a.5.5 0 010 1H3a.5.5 0 01-.5-.5z"/></svg>
        </button>
      </div>
      <button class="btn btn-primary" onclick="openModal('addProductModal')">
        <svg width="14" height="14" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
        Add Product
      </button>
    </div>
  </header>

  <div class="content fade-in">

    <!-- STAT CARDS -->
    <div class="stats-grid stagger">
      <div class="stat-card featured">
        <div class="stat-label">Total Products <div class="stat-icon" style="background:rgba(79,142,247,0.2)">📦</div></div>
        <div class="stat-value">142</div>
        <div class="stat-change up"><svg width="12" height="12" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24"><polyline points="18 15 12 9 6 15"/></svg>+8 this month</div>
      </div>
      <div class="stat-card">
        <div class="stat-label">In Stock <div class="stat-icon" style="background:rgba(34,211,165,0.12)">✅</div></div>
        <div class="stat-value">118</div>
        <div class="stat-change up"><svg width="12" height="12" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24"><polyline points="18 15 12 9 6 15"/></svg>83.1% available</div>
      </div>
      <div class="stat-card">
        <div class="stat-label">Low Stock <div class="stat-icon" style="background:rgba(247,201,79,0.1)">⚠️</div></div>
        <div class="stat-value">18</div>
        <div class="stat-change down"><svg width="12" height="12" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"/></svg>Restock needed</div>
      </div>
      <div class="stat-card">
        <div class="stat-label">Avg. Price <div class="stat-icon" style="background:rgba(110,231,247,0.1)">💰</div></div>
        <div class="stat-value">$187</div>
        <div class="stat-change up"><svg width="12" height="12" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24"><polyline points="18 15 12 9 6 15"/></svg>+4.2% vs last yr</div>
      </div>
    </div>

    <!-- SALES + CATEGORY CHARTS -->
    <div class="grid-60-40 mb-20">
      <div class="card">
        <div class="card-header">
          <div><div class="card-title">Sales by Category</div><div class="card-subtitle">Units sold this quarter</div></div>
        </div>
        <canvas id="catBar" style="width:100%;height:200px;display:block"></canvas>
      </div>
      <div class="card">
        <div class="card-header">
          <div><div class="card-title">Revenue Split</div><div class="card-subtitle">By category</div></div>
        </div>
        <div class="flex items-center gap-16">
          <div class="donut-wrap">
            <svg id="prodDonut" width="130" height="130" viewBox="0 0 140 140"></svg>
            <div class="donut-label"><div class="value">$142K</div><div class="sub">Revenue</div></div>
          </div>
          <div class="legend" style="gap:12px">
            <div class="legend-item"><span class="legend-dot" style="background:#4f8ef7"></span>Controllers — 34%</div>
            <div class="legend-item"><span class="legend-dot" style="background:#22d3a5"></span>Audio — 22%</div>
            <div class="legend-item"><span class="legend-dot" style="background:#f7c94f"></span>Keyboards — 18%</div>
            <div class="legend-item"><span class="legend-dot" style="background:#6ee7f7"></span>Accessories — 14%</div>
            <div class="legend-item"><span class="legend-dot" style="background:#f76f6f"></span>Mice &amp; Monitors — 12%</div>
          </div>
        </div>
      </div>
    </div>

    <!-- PRODUCT DISPLAY -->
    <div class="card">
      <div class="card-header">
        <div><div class="card-title">Product Catalog</div><div class="card-subtitle" id="prodCount">Showing all products</div></div>
        <button class="btn btn-ghost btn-sm">Export</button>
      </div>
      <div id="gridView">
        <div class="product-grid" id="productGrid"></div>
      </div>
      <div id="listView" style="display:none">
        <div class="table-wrap">
          <table>
            <thead><tr><th>Product</th><th>Category</th><th>Price</th><th>Stock</th><th>Sales</th><th>Status</th><th>Action</th></tr></thead>
            <tbody id="productList"></tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</main>

<!-- ADD PRODUCT MODAL -->
<div class="modal-overlay" id="addProductModal">
  <div class="modal">
    <div class="modal-header">
      <span class="modal-title">Add Product</span>
      <span class="modal-close" onclick="closeModal('addProductModal')">&#10005;</span>
    </div>
    <div class="form-group">
      <label class="form-label">Product Name</label>
      <input class="form-input" placeholder="e.g. Apex Controller Pro" id="newPName" />
    </div>
    <div class="grid-2" style="gap:14px">
      <div class="form-group">
        <label class="form-label">Category</label>
        <select class="form-input" id="newPCat">
          <option>Controllers</option><option>Audio</option><option>Keyboards</option>
          <option>Accessories</option><option>Mice</option><option>Monitors</option>
        </select>
      </div>
      <div class="form-group">
        <label class="form-label">Price ($)</label>
        <input class="form-input" type="number" placeholder="0.00" id="newPPrice" />
      </div>
    </div>
    <div class="form-group">
      <label class="form-label">Stock Quantity</label>
      <input class="form-input" type="number" placeholder="0" id="newPStock" />
    </div>
    <div class="modal-footer">
      <button class="btn btn-ghost" onclick="closeModal('addProductModal')">Cancel</button>
      <button class="btn btn-primary" onclick="addProduct()">Add Product</button>
    </div>
  </div>
</div>

<div id="toast"></div>
<script src="${pageContext.request.contextPath}/javaScript/App.js"></script>
<script src="${pageContext.request.contextPath}/javaScript/Sidebar.js"></script>
<script>
var catEmoji  = { Controllers:'🎮', Audio:'🎧', Keyboards:'⌨️', Accessories:'🖱️', Mice:'🖱️', Monitors:'🖥️' };
var catColors = { Controllers:'#4f8ef7', Audio:'#22d3a5', Keyboards:'#f7c94f', Accessories:'#6ee7f7', Mice:'#f76f6f', Monitors:'#a78bfa' };

var products = [
  { name:'Apex Controller Pro',  cat:'Controllers', price:'$299.99', stock:42,  sales:340, status:'In Stock'    },
  { name:'Nexa Headset X1',      cat:'Audio',       price:'$89.99',  stock:88,  sales:272, status:'In Stock'    },
  { name:'VortexPad RGB',        cat:'Accessories', price:'$49.99',  stock:120, sales:198, status:'In Stock'    },
  { name:'StrikeBoard Mech',     cat:'Keyboards',   price:'$179.99', stock:14,  sales:156, status:'Low Stock'   },
  { name:'ShadowMouse Ultra',    cat:'Mice',        price:'$69.99',  stock:56,  sales:142, status:'In Stock'    },
  { name:'CrystalView 27"',      cat:'Monitors',    price:'$499.99', stock:8,   sales:88,  status:'Low Stock'   },
  { name:'FlexGrip Thumb Pack',  cat:'Accessories', price:'$19.99',  stock:200, sales:520, status:'In Stock'    },
  { name:'PulseCharge Station',  cat:'Accessories', price:'$39.99',  stock:0,   sales:110, status:'Out of Stock'},
  { name:'BoltLink USB-C Hub',   cat:'Accessories', price:'$59.99',  stock:34,  sales:98,  status:'In Stock'    },
  { name:'Lunar Keyboard TKL',   cat:'Keyboards',   price:'$129.99', stock:22,  sales:74,  status:'In Stock'    },
  { name:'RiftBuds Wireless',    cat:'Audio',       price:'$149.99', stock:18,  sales:65,  status:'Low Stock'   },
  { name:'DualEdge Controller',  cat:'Controllers', price:'$79.99',  stock:60,  sales:210, status:'In Stock'    }
];

// Tracks which index in `products` each rendered row corresponds to
var filteredIndexMap = [];

var currentView = 'grid';

function setView(v, btn) {
  currentView = v;
  document.getElementById('gridView').style.display = v === 'grid' ? '' : 'none';
  document.getElementById('listView').style.display = v === 'list' ? '' : 'none';
  document.querySelectorAll('.view-btn').forEach(function(b) { b.classList.remove('active'); });
  btn.classList.add('active');
}

function stockBadge(s) {
  if (s === 'In Stock')     return 'badge-success';
  if (s === 'Low Stock')    return 'badge-warning';
  return 'badge-danger';
}

function renderProducts() {
  var search = document.getElementById('searchInput').value.toLowerCase();
  var cf     = document.getElementById('catFilter').value;

  // Build filtered list while remembering original indices
  var filtered = [];
  filteredIndexMap = [];
  for (var i = 0; i < products.length; i++) {
    var p = products[i];
    if (cf && p.cat !== cf) continue;
    if (search && p.name.toLowerCase().indexOf(search) === -1) continue;
    filtered.push(p);
    filteredIndexMap.push(i);
  }

  document.getElementById('prodCount').textContent = 'Showing ' + filtered.length + ' products';

  // ── GRID VIEW ────────────────────────────────────────────────
  var gridHTML = '';
  for (var gi = 0; gi < filtered.length; gi++) {
    var gp = filtered[gi];
    var gColor = catColors[gp.cat];
    gridHTML +=
      '<div class="product-card">' +
        '<div class="product-img" style="background:linear-gradient(135deg,' + gColor + '18,' + gColor + '08)">' +
          '<span>' + catEmoji[gp.cat] + '</span>' +
          '<span class="badge ' + stockBadge(gp.status) + '" style="position:absolute;top:10px;right:10px">' + gp.status + '</span>' +
        '</div>' +
        '<div class="product-body">' +
          '<div class="product-name">' + gp.name + '</div>' +
          '<div class="product-cat">' + gp.cat + '</div>' +
          '<div class="flex justify-between items-center">' +
            '<div class="product-price">' + gp.price + '</div>' +
            '<div class="text-sm text-muted">' + gp.sales + ' sold</div>' +
          '</div>' +
        '</div>' +
        '<div class="product-footer">' +
          '<div class="stock-bar-wrap">' +
            '<div class="flex justify-between mb-4">' +
              '<span class="text-xs text-muted">Stock</span>' +
              '<span class="text-xs font-mono text-accent">' + gp.stock + ' units</span>' +
            '</div>' +
            '<div class="progress"><div class="progress-bar" style="width:' + Math.min(gp.stock / 150 * 100, 100) + '%;background:' + gColor + '"></div></div>' +
          '</div>' +
        '</div>' +
      '</div>';
  }
  document.getElementById('productGrid').innerHTML = gridHTML;

  // ── LIST VIEW ─────────────────────────────────────────────────
  // FIX: use data-idx attribute instead of inline onclick with interpolated name string.
  // This avoids JSP EL parsing and eliminates all quote-escaping issues.
  var listHTML = '';
  for (var li = 0; li < filtered.length; li++) {
    var lp     = filtered[li];
    var lColor = catColors[lp.cat];
    var origIdx = filteredIndexMap[li];
    listHTML +=
      '<tr>' +
        '<td>' +
          '<div class="flex items-center gap-12">' +
            '<div class="avatar avatar-sm" style="border-radius:8px;background:' + lColor + '22;color:' + lColor + ';font-size:14px">' + catEmoji[lp.cat] + '</div>' +
            '<strong>' + lp.name + '</strong>' +
          '</div>' +
        '</td>' +
        '<td class="text-muted">' + lp.cat + '</td>' +
        '<td><strong>' + lp.price + '</strong></td>' +
        '<td><span class="font-mono">' + lp.stock + '</span></td>' +
        '<td><span class="font-mono text-accent">' + lp.sales + '</span></td>' +
        '<td><span class="badge ' + stockBadge(lp.status) + '">' + lp.status + '</span></td>' +
        '<td>' +
          '<div class="flex gap-8">' +
            '<button class="btn btn-ghost btn-sm">Edit</button>' +
            // KEY FIX: store the original array index in data-idx — no string quoting needed
            '<button class="btn btn-danger btn-sm delete-btn" data-idx="' + origIdx + '">Delete</button>' +
          '</div>' +
        '</td>' +
      '</tr>';
  }
  document.getElementById('productList').innerHTML = listHTML;

  // Attach delete listeners after rendering (event delegation on tbody)
  document.getElementById('productList').querySelectorAll('.delete-btn').forEach(function(btn) {
    btn.addEventListener('click', function() {
      var idx = parseInt(this.getAttribute('data-idx'), 10);
      removeProductByIndex(idx);
    });
  });
}

function addProduct() {
  var n = document.getElementById('newPName').value.trim();
  var c = document.getElementById('newPCat').value;
  var pr = parseFloat(document.getElementById('newPPrice').value) || 0;
  var s = parseInt(document.getElementById('newPStock').value, 10) || 0;
  if (!n) { showToast('Enter a product name'); return; }
  var status = s > 20 ? 'In Stock' : s > 0 ? 'Low Stock' : 'Out of Stock';
  products.unshift({ name: n, cat: c, price: '$' + pr.toFixed(2), stock: s, sales: 0, status: status });
  closeModal('addProductModal');
  renderProducts();
  showToast('Product added');
}

// Remove by original array index — no string matching, no escaping problems
function removeProductByIndex(idx) {
  products.splice(idx, 1);
  renderProducts();
  showToast('Product removed');
}

document.getElementById('searchInput').addEventListener('input', renderProducts);
document.getElementById('catFilter').addEventListener('change', renderProducts);
renderProducts();

function initCharts() {
  drawBarChart('catBar',
    [340, 337, 230, 156, 142, 88],
    ['Controllers', 'Audio', 'Accessories', 'Keyboards', 'Mice', 'Monitors'],
    '#4f8ef7'
  );
  drawDonut('prodDonut', [
    { value: 34, color: '#4f8ef7' },
    { value: 22, color: '#22d3a5' },
    { value: 18, color: '#f7c94f' },
    { value: 14, color: '#6ee7f7' },
    { value: 12, color: '#f76f6f' }
  ]);
}
initCharts();
</script>
</body>
</html>
