<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Corexa — Customers</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/Style.css">
</head>
<body>

<div id="sidebar-root"></div>

<main class="main">
  <header class="topbar">
    <div class="page-title-group">
      <h1>Customers</h1>
      <p>Manage your customer base and relationships</p>
    </div>
    <div class="topbar-actions">
      <div class="topbar-search">
        <svg width="14" height="14" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
        <input type="text" placeholder="Search customers…" id="searchInput" />
      </div>
      <select id="tierFilter">
        <option value="">All Tiers</option>
        <option value="Platinum">Platinum</option>
        <option value="Gold">Gold</option>
        <option value="Silver">Silver</option>
        <option value="Bronze">Bronze</option>
      </select>
      <button class="btn btn-primary" onclick="openModal('addCustomerModal')">
        <svg width="14" height="14" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
        Add Customer
      </button>
    </div>
  </header>

  <div class="content fade-in">

    <!-- STAT CARDS -->
    <div class="stats-grid stagger">
      <div class="stat-card featured">
        <div class="stat-label">Total Customers <div class="stat-icon" style="background:rgba(79,142,247,0.2)">👥</div></div>
        <div class="stat-value">3,842</div>
        <div class="stat-change up"><svg width="12" height="12" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24"><polyline points="18 15 12 9 6 15"/></svg>+320 this month</div>
      </div>
      <div class="stat-card">
        <div class="stat-label">Active <div class="stat-icon" style="background:rgba(34,211,165,0.12)">🟢</div></div>
        <div class="stat-value">2,910</div>
        <div class="stat-change up"><svg width="12" height="12" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24"><polyline points="18 15 12 9 6 15"/></svg>75.7% active rate</div>
      </div>
      <div class="stat-card">
        <div class="stat-label">Avg. LTV <div class="stat-icon" style="background:rgba(247,201,79,0.1)">💎</div></div>
        <div class="stat-value">$432</div>
        <div class="stat-change up"><svg width="12" height="12" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24"><polyline points="18 15 12 9 6 15"/></svg>+18% YoY</div>
      </div>
      <div class="stat-card">
        <div class="stat-label">Churn Rate <div class="stat-icon" style="background:rgba(247,111,111,0.1)">📉</div></div>
        <div class="stat-value">2.4%</div>
        <div class="stat-change up"><svg width="12" height="12" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24"><polyline points="18 15 12 9 6 15"/></svg>Down from 3.1%</div>
      </div>
    </div>

    <!-- GROWTH CHART + SEGMENT DONUT -->
    <div class="grid-60-40 mb-20">
      <div class="card">
        <div class="card-header">
          <div><div class="card-title">Customer Growth</div><div class="card-subtitle">Monthly new registrations</div></div>
          <select><option>2025</option><option>2024</option></select>
        </div>
        <canvas id="growthChart" style="width:100%;height:200px;display:block"></canvas>
        <div class="flex gap-16 mt-16">
          <div class="legend-item"><span class="legend-dot" style="background:#4f8ef7"></span>New Customers</div>
          <div class="legend-item"><span class="legend-dot" style="background:#22d3a5"></span>Returning</div>
        </div>
      </div>
      <div class="card">
        <div class="card-header">
          <div><div class="card-title">Tier Breakdown</div><div class="card-subtitle">Customer segments</div></div>
        </div>
        <div class="flex items-center gap-16">
          <div class="donut-wrap">
            <svg id="tierDonut" width="130" height="130" viewBox="0 0 140 140"></svg>
            <div class="donut-label"><div class="value">3,842</div><div class="sub">Total</div></div>
          </div>
          <div class="legend" style="gap:14px">
            <div class="legend-item"><span class="legend-dot" style="background:#6ee7f7"></span>Platinum — 8%</div>
            <div class="legend-item"><span class="legend-dot" style="background:#f7c94f"></span>Gold — 22%</div>
            <div class="legend-item"><span class="legend-dot" style="background:#4f8ef7"></span>Silver — 40%</div>
            <div class="legend-item"><span class="legend-dot" style="background:#526080"></span>Bronze — 30%</div>
          </div>
        </div>
      </div>
    </div>

    <!-- CUSTOMERS TABLE -->
    <div class="card">
      <div class="card-header">
        <div><div class="card-title">Customer Directory</div><div class="card-subtitle" id="custCount">Showing all customers</div></div>
        <button class="btn btn-ghost btn-sm">Export</button>
      </div>
      <div class="table-wrap">
        <table>
          <thead><tr>
            <th>Customer</th><th>Email</th><th>Location</th><th>Orders</th><th>Total Spent</th><th>Tier</th><th>Joined</th><th>Action</th>
          </tr></thead>
          <tbody id="custBody"></tbody>
        </table>
      </div>
    </div>

  </div>
</main>

<!-- ADD CUSTOMER MODAL -->
<div class="modal-overlay" id="addCustomerModal">
  <div class="modal">
    <div class="modal-header">
      <span class="modal-title">Add Customer</span>
      <span class="modal-close" onclick="closeModal('addCustomerModal')">✕</span>
    </div>
    <div class="grid-2" style="gap:14px">
      <div class="form-group">
        <label class="form-label">First Name</label>
        <input class="form-input" placeholder="First name" id="newFirst" />
      </div>
      <div class="form-group">
        <label class="form-label">Last Name</label>
        <input class="form-input" placeholder="Last name" id="newLast" />
      </div>
    </div>
    <div class="form-group">
      <label class="form-label">Email</label>
      <input class="form-input" type="email" placeholder="email@example.com" id="newEmail" />
    </div>
    <div class="grid-2" style="gap:14px">
      <div class="form-group">
        <label class="form-label">Location</label>
        <input class="form-input" placeholder="City, Country" id="newLocation" />
      </div>
      <div class="form-group">
        <label class="form-label">Tier</label>
        <select class="form-input" id="newTier">
          <option>Bronze</option><option>Silver</option><option>Gold</option><option>Platinum</option>
        </select>
      </div>
    </div>
    <div class="modal-footer">
      <button class="btn btn-ghost" onclick="closeModal('addCustomerModal')">Cancel</button>
      <button class="btn btn-primary" onclick="addCustomer()">Add Customer</button>
    </div>
  </div>
</div>

<div id="toast"></div>
<script src="${pageContext.request.contextPath}/javaScript/App.js"></script>
<script src="${pageContext.request.contextPath}/javaScript/Sidebar.js"></script>
<script>
const tierBadge = { Platinum:'badge-info', Gold:'badge-warning', Silver:'badge-muted', Bronze:'badge-muted' };
const tierColors = { Platinum:'#6ee7f7', Gold:'#f7c94f', Silver:'#8fa3cc', Bronze:'#526080' };
const initials = n => n.split(' ').map(w=>w[0]).join('').toUpperCase();

let customers = [
  { name:'Alex Mercer', email:'alex@example.com', location:'New York, US', orders:14, spent:'$2,800', tier:'Gold', joined:'Jan 2024' },
  { name:'Priya Shah', email:'priya@example.com', location:'Mumbai, IN', orders:9, spent:'$1,450', tier:'Silver', joined:'Feb 2024' },
  { name:'Liam Torres', email:'liam@example.com', location:'Madrid, ES', orders:22, spent:'$4,600', tier:'Platinum', joined:'Nov 2023' },
  { name:'Nina Okafor', email:'nina@example.com', location:'Lagos, NG', orders:6, spent:'$850', tier:'Bronze', joined:'Mar 2024' },
  { name:'James Liu', email:'james@example.com', location:'Beijing, CN', orders:18, spent:'$3,200', tier:'Gold', joined:'Dec 2023' },
  { name:'Sofia Reyes', email:'sofia@example.com', location:'São Paulo, BR', orders:11, spent:'$1,900', tier:'Silver', joined:'Jan 2024' },
  { name:'Marcus Webb', email:'marcus@example.com', location:'London, UK', orders:31, spent:'$7,100', tier:'Platinum', joined:'Oct 2023' },
  { name:'Aisha Patel', email:'aisha@example.com', location:'Dubai, AE', orders:7, spent:'$1,100', tier:'Silver', joined:'Apr 2024' },
  { name:'Ryan Costa', email:'ryan@example.com', location:'Toronto, CA', orders:5, spent:'$640', tier:'Bronze', joined:'Apr 2024' },
  { name:'Yuna Kim', email:'yuna@example.com', location:'Seoul, KR', orders:19, spent:'$3,900', tier:'Gold', joined:'Dec 2023' },
];

function renderCustomers() {
  const search = document.getElementById('searchInput').value.toLowerCase();
  const tf = document.getElementById('tierFilter').value;
  const filtered = customers.filter(c =>
    (!tf || c.tier === tf) &&
    (!search || c.name.toLowerCase().includes(search) || c.email.toLowerCase().includes(search))
  );
  document.getElementById('custCount').textContent = `Showing ${filtered.length} customers`;
  document.getElementById('custBody').innerHTML = filtered.map(c => `
    <tr>
      <td>
        <div class="flex items-center gap-12">
          <div class="avatar" style="background:linear-gradient(135deg,${tierColors[c.tier]}44,${tierColors[c.tier]}22);color:${tierColors[c.tier]}">${initials(c.name)}</div>
          <strong>${c.name}</strong>
        </div>
      </td>
      <td class="text-muted">${c.email}</td>
      <td class="text-muted">${c.location}</td>
      <td><strong>${c.orders}</strong></td>
      <td><strong>${c.spent}</strong></td>
      <td><span class="badge ${tierBadge[c.tier]}">${c.tier}</span></td>
      <td class="text-muted">${c.joined}</td>
      <td>
        <div class="flex gap-8">
          <button class="btn btn-ghost btn-sm">Profile</button>
          <button class="btn btn-danger btn-sm" onclick="removeCustomer('${c.email}')">Remove</button>
        </div>
      </td>
    </tr>`).join('');
}

function addCustomer() {
  const f = document.getElementById('newFirst').value.trim();
  const l = document.getElementById('newLast').value.trim();
  const e = document.getElementById('newEmail').value.trim();
  const loc = document.getElementById('newLocation').value.trim();
  const t = document.getElementById('newTier').value;
  if (!f || !l || !e) { showToast('Please fill required fields'); return; }
  customers.unshift({ name:`${f} ${l}`, email:e, location:loc||'Unknown', orders:0, spent:'$0', tier:t, joined:'May 2025' });
  closeModal('addCustomerModal');
  renderCustomers();
  showToast('✅ Customer added successfully');
}
function removeCustomer(email) {
  customers = customers.filter(c => c.email !== email);
  renderCustomers();
  showToast('🗑 Customer removed');
}
document.getElementById('searchInput').addEventListener('input', renderCustomers);
document.getElementById('tierFilter').addEventListener('change', renderCustomers);
renderCustomers();

function initCharts() {
  drawLineChart('growthChart', [
    { data: [180, 220, 195, 280, 320, 290, 350, 310, 390, 420, 380, 460], color: '#4f8ef7' },
    { data: [90,  130, 110, 160, 195, 175, 210, 190, 240, 260, 230, 290], color: '#22d3a5' },
  ], ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']);
  drawDonut('tierDonut', [
    { value: 8,  color: '#6ee7f7' },
    { value: 22, color: '#f7c94f' },
    { value: 40, color: '#4f8ef7' },
    { value: 30, color: '#526080' },
  ]);
}
initCharts();
</script>
</body>
</html>