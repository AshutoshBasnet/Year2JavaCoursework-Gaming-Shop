<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Corexa — Orders</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/Style.css">
</head>
<body>

<div id="sidebar-root"></div>

<main class="main">
  <header class="topbar">
    <div class="page-title-group">
      <h1>Orders</h1>
      <p>Manage and track all customer orders</p>
    </div>
    <div class="topbar-actions">
      <div class="topbar-search">
        <svg width="14" height="14" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
        <input type="text" placeholder="Search orders…" id="searchInput" />
      </div>
      <select id="statusFilter">
        <option value="">All Status</option>
        <option value="Delivered">Delivered</option>
        <option value="Pending">Pending</option>
        <option value="Processing">Processing</option>
        <option value="Cancelled">Cancelled</option>
      </select>
      <button class="btn btn-primary" onclick="openModal('addOrderModal')">
        <svg width="14" height="14" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
        New Order
      </button>
    </div>
  </header>

  <div class="content fade-in">

    <!-- STAT CARDS -->
    <div class="stats-grid stagger" style="grid-template-columns:repeat(4,1fr)">
      <div class="stat-card featured">
        <div class="stat-label">Total Orders <div class="stat-icon" style="background:rgba(79,142,247,0.2)">📋</div></div>
        <div class="stat-value">1,840</div>
        <div class="stat-change up"><svg width="12" height="12" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24"><polyline points="18 15 12 9 6 15"/></svg>+9% this month</div>
      </div>
      <div class="stat-card">
        <div class="stat-label">Delivered <div class="stat-icon" style="background:rgba(34,211,165,0.12)">✅</div></div>
        <div class="stat-value">1,320</div>
        <div class="stat-change up"><svg width="12" height="12" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24"><polyline points="18 15 12 9 6 15"/></svg>71.7% rate</div>
      </div>
      <div class="stat-card">
        <div class="stat-label">Pending <div class="stat-icon" style="background:rgba(247,201,79,0.1)">⏳</div></div>
        <div class="stat-value">340</div>
        <div class="stat-change down"><svg width="12" height="12" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"/></svg>Needs review</div>
      </div>
      <div class="stat-card">
        <div class="stat-label">Cancelled <div class="stat-icon" style="background:rgba(247,111,111,0.1)">❌</div></div>
        <div class="stat-value">180</div>
        <div class="stat-change down"><svg width="12" height="12" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"/></svg>9.8% rate</div>
      </div>
    </div>

    <!-- ORDERS CHART + BREAKDOWN -->
    <div class="grid-60-40 mb-20">
      <div class="card">
        <div class="card-header">
          <div><div class="card-title">Order Volume</div><div class="card-subtitle">Daily orders this month</div></div>
          <select><option>Last 30 days</option><option>Last 7 days</option></select>
        </div>
        <canvas id="barChart" style="width:100%;height:200px;display:block"></canvas>
      </div>
      <div class="card">
        <div class="card-header">
          <div><div class="card-title">Order Status</div><div class="card-subtitle">Distribution breakdown</div></div>
        </div>
        <div class="flex items-center gap-16">
          <div class="donut-wrap">
            <svg id="orderDonut" width="130" height="130" viewBox="0 0 140 140"></svg>
            <div class="donut-label"><div class="value">1,840</div><div class="sub">Orders</div></div>
          </div>
          <div class="legend" style="gap:14px">
            <div class="legend-item"><span class="legend-dot" style="background:#22d3a5"></span>Delivered — 71.7%</div>
            <div class="legend-item"><span class="legend-dot" style="background:#f7c94f"></span>Pending — 18.5%</div>
            <div class="legend-item"><span class="legend-dot" style="background:#4f8ef7"></span>Processing — 9.8%</div>
            <div class="legend-item"><span class="legend-dot" style="background:#f76f6f"></span>Cancelled — 7%</div>
          </div>
        </div>
      </div>
    </div>

    <!-- TABLE -->
    <div class="card">
      <div class="card-header">
        <div><div class="card-title">All Orders</div><div class="card-subtitle" id="orderCount">Showing 12 orders</div></div>
        <div class="flex gap-8">
          <button class="btn btn-ghost btn-sm">Export CSV</button>
        </div>
      </div>
      <div class="table-wrap">
        <table>
          <thead><tr>
            <th><input type="checkbox" id="checkAll" style="accent-color:var(--accent)" /></th>
            <th>Order ID</th><th>Customer</th><th>Product</th><th>Date</th><th>Amount</th><th>Status</th><th>Action</th>
          </tr></thead>
          <tbody id="ordersBody"></tbody>
        </table>
      </div>
    </div>

  </div>
</main>

<!-- ADD ORDER MODAL -->
<div class="modal-overlay" id="addOrderModal">
  <div class="modal">
    <div class="modal-header">
      <span class="modal-title">New Order</span>
      <span class="modal-close" onclick="closeModal('addOrderModal')">✕</span>
    </div>
    <div class="form-group">
      <label class="form-label">Customer Name</label>
      <input class="form-input" placeholder="Enter customer name" id="newCustomer" />
    </div>
    <div class="form-group">
      <label class="form-label">Product</label>
      <input class="form-input" placeholder="Enter product" id="newProduct" />
    </div>
    <div class="grid-2" style="gap:14px">
      <div class="form-group">
        <label class="form-label">Amount ($)</label>
        <input class="form-input" type="number" placeholder="0.00" id="newAmount" />
      </div>
      <div class="form-group">
        <label class="form-label">Status</label>
        <select class="form-input" id="newStatus">
          <option>Pending</option><option>Processing</option><option>Delivered</option>
        </select>
      </div>
    </div>
    <div class="modal-footer">
      <button class="btn btn-ghost" onclick="closeModal('addOrderModal')">Cancel</button>
      <button class="btn btn-primary" onclick="addOrder()">Create Order</button>
    </div>
  </div>
</div>

<div id="toast"></div>
<script src="${pageContext.request.contextPath}/javaScript/App.js"></script>
<script src="${pageContext.request.contextPath}/javaScript/Sidebar.js"></script>
<script>
const statusBadge = { Delivered:'badge-success', Pending:'badge-warning', Processing:'badge-info', Cancelled:'badge-danger' };
let orders = [
  { id:'CX-1042', customer:'Alex Mercer', product:'Apex Controller Pro', date:'May 2, 2025', amount:'$320.00', status:'Delivered' },
  { id:'CX-1041', customer:'Priya Shah', product:'Nexa Headset X1', date:'May 2, 2025', amount:'$89.50', status:'Pending' },
  { id:'CX-1040', customer:'Liam Torres', product:'VortexPad RGB', date:'May 1, 2025', amount:'$154.00', status:'Processing' },
  { id:'CX-1039', customer:'Nina Okafor', product:'StrikeBoard Mech', date:'May 1, 2025', amount:'$211.00', status:'Delivered' },
  { id:'CX-1038', customer:'James Liu', product:'ShadowMouse Ultra', date:'Apr 30, 2025', amount:'$76.00', status:'Cancelled' },
  { id:'CX-1037', customer:'Sofia Reyes', product:'Apex Controller Pro', date:'Apr 29, 2025', amount:'$320.00', status:'Delivered' },
  { id:'CX-1036', customer:'Marcus Webb', product:'Nexa Headset X1', date:'Apr 29, 2025', amount:'$89.50', status:'Delivered' },
  { id:'CX-1035', customer:'Aisha Patel', product:'VortexPad RGB', date:'Apr 28, 2025', amount:'$154.00', status:'Pending' },
  { id:'CX-1034', customer:'Ryan Costa', product:'StrikeBoard Mech', date:'Apr 27, 2025', amount:'$211.00', status:'Processing' },
  { id:'CX-1033', customer:'Yuna Kim', product:'ShadowMouse Ultra', date:'Apr 26, 2025', amount:'$76.00', status:'Delivered' },
  { id:'CX-1032', customer:'Omar Hassan', product:'Apex Controller Pro', date:'Apr 25, 2025', amount:'$320.00', status:'Pending' },
  { id:'CX-1031', customer:'Chloe Martin', product:'Nexa Headset X1', date:'Apr 24, 2025', amount:'$89.50', status:'Delivered' },
];

function renderOrders() {
  const search = document.getElementById('searchInput').value.toLowerCase();
  const sf = document.getElementById('statusFilter').value;
  const filtered = orders.filter(o =>
    (!sf || o.status === sf) &&
    (!search || o.customer.toLowerCase().includes(search) || o.id.toLowerCase().includes(search))
  );
  document.getElementById('orderCount').textContent = `Showing ${filtered.length} orders`;
  const body = document.getElementById('ordersBody');
  body.innerHTML = filtered.map(o => `
    <tr>
      <td><input type="checkbox" style="accent-color:var(--accent)"></td>
      <td><span class="font-mono text-accent">#${o.id}</span></td>
      <td><strong>${o.customer}</strong></td>
      <td>${o.product}</td>
      <td class="text-muted">${o.date}</td>
      <td><strong>${o.amount}</strong></td>
      <td><span class="badge ${statusBadge[o.status]}">${o.status}</span></td>
      <td>
        <div class="flex gap-8">
          <button class="btn btn-ghost btn-sm">View</button>
          <button class="btn btn-danger btn-sm" onclick="deleteOrder('${o.id}')">Remove</button>
        </div>
      </td>
    </tr>`).join('');
}

function addOrder() {
  const c = document.getElementById('newCustomer').value.trim();
  const p = document.getElementById('newProduct').value.trim();
  const a = parseFloat(document.getElementById('newAmount').value) || 0;
  const s = document.getElementById('newStatus').value;
  if (!c || !p) { showToast('Please fill in all fields'); return; }
  const newId = 'CX-' + (1043 + orders.length);
  orders.unshift({ id: newId, customer: c, product: p, date: 'May 3, 2025', amount: '$' + a.toFixed(2), status: s });
  closeModal('addOrderModal');
  renderOrders();
  showToast('✅ Order ' + newId + ' created');
}
function deleteOrder(id) {
  orders = orders.filter(o => o.id !== id);
  renderOrders();
  showToast('🗑 Order removed');
}
document.getElementById('searchInput').addEventListener('input', renderOrders);
document.getElementById('statusFilter').addEventListener('change', renderOrders);
document.getElementById('checkAll').addEventListener('change', e => {
  document.querySelectorAll('#ordersBody input[type=checkbox]').forEach(cb => cb.checked = e.target.checked);
});
renderOrders();

function initCharts() {
  drawBarChart('barChart',
    [42,58,34,67,72,55,80,48,63,90,74,85,56,44,68,77,92,60,48,73,85,69,55,40,78,83,66,72,88,95],
    ['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30'],
    '#4f8ef7'
  );
  drawDonut('orderDonut', [
    { value: 71.7, color: '#22d3a5' },
    { value: 18.5, color: '#f7c94f' },
    { value: 9.8,  color: '#4f8ef7' },
    { value: 7,    color: '#f76f6f' },
  ]);
}
initCharts();
</script>
</body>
</html>