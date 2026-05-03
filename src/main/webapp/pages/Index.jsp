<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Corexa — Dashboard</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/Style.css">
</head>
<body>

<div id="sidebar-root"></div>

<main class="main">
  <!-- TOPBAR -->
  <header class="topbar">
    <div class="page-title-group">
      <h1>Dashboard Overview</h1>
      <p>Monitor your business performance in real-time</p>
    </div>
    <div class="topbar-actions">
      <div class="topbar-search">
        <svg width="14" height="14" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
        <input type="text" placeholder="Search…" />
      </div>
      <div class="chip">
        <svg width="13" height="13" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>
        This Month
      </div>
      <div class="btn-icon" title="Notifications">
        <svg width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M18 8A6 6 0 006 8c0 7-3 9-3 9h18s-3-2-3-9M13.73 21a2 2 0 01-3.46 0"/></svg>
        <span class="notif-dot"></span>
      </div>
    </div>
  </header>

  <!-- CONTENT -->
  <div class="content fade-in">

    <!-- WELCOME BANNER -->
    <div class="welcome-banner">
      <div class="welcome-text">
        <h2>Hello, Bishesta! 👋</h2>
        <p>Welcome back, Admin — manage your gaming store with ease and control.</p>
      </div>
      <button class="btn btn-primary">
        <svg width="14" height="14" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
        New Report
      </button>
    </div>

    <!-- STAT CARDS -->
    <div class="stats-grid stagger">
      <div class="stat-card featured">
        <div class="stat-label">
          Total Revenue
          <div class="stat-icon" style="background:rgba(79,142,247,0.2)">💰</div>
        </div>
        <div class="stat-value">$24,580</div>
        <div class="stat-change up">
          <svg width="12" height="12" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24"><polyline points="18 15 12 9 6 15"/></svg>
          +12% from last month
        </div>
      </div>
      <div class="stat-card">
        <div class="stat-label">
          Active Users
          <div class="stat-icon" style="background:rgba(34,211,165,0.12)">👤</div>
        </div>
        <div class="stat-value">1,245</div>
        <div class="stat-change up">
          <svg width="12" height="12" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24"><polyline points="18 15 12 9 6 15"/></svg>
          +8% growth
        </div>
      </div>
      <div class="stat-card">
        <div class="stat-label">
          New Signups
          <div class="stat-icon" style="background:rgba(110,231,247,0.1)">📥</div>
        </div>
        <div class="stat-value">320</div>
        <div class="stat-change up">
          <svg width="12" height="12" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24"><polyline points="18 15 12 9 6 15"/></svg>
          +5% this week
        </div>
      </div>
      <div class="stat-card">
        <div class="stat-label">
          Conversion Rate
          <div class="stat-icon" style="background:rgba(247,201,79,0.1)">📈</div>
        </div>
        <div class="stat-value">4.8%</div>
        <div class="stat-change up">
          <svg width="12" height="12" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24"><polyline points="18 15 12 9 6 15"/></svg>
          +1.2% increase
        </div>
      </div>
    </div>

    <!-- CHARTS ROW -->
    <div class="grid-60-40 mb-20">
      <!-- LINE CHART -->
      <div class="card">
        <div class="card-header">
          <div>
            <div class="card-title">Revenue Trend</div>
            <div class="card-subtitle">Monthly performance overview</div>
          </div>
          <select>
            <option>2025</option>
            <option>2024</option>
          </select>
        </div>
        <canvas id="lineChart" style="width:100%;height:210px;display:block"></canvas>
        <div class="flex gap-16 mt-16">
          <div class="legend-item"><span class="legend-dot" style="background:#4f8ef7"></span>Revenue</div>
          <div class="legend-item"><span class="legend-dot" style="background:#6ee7f7"></span>Orders</div>
          <div class="legend-item"><span class="legend-dot" style="background:#22d3a5"></span>Profit</div>
        </div>
      </div>

      <!-- DONUT -->
      <div class="card">
        <div class="card-header">
          <div>
            <div class="card-title">Revenue Analytics</div>
            <div class="card-subtitle">Quarterly breakdown</div>
          </div>
        </div>
        <div class="flex items-center gap-16">
          <div class="donut-wrap">
            <svg id="donutChart" width="140" height="140" viewBox="0 0 140 140"></svg>
            <div class="donut-label">
              <div class="value">$120K</div>
              <div class="sub">Total</div>
            </div>
          </div>
          <div class="legend">
            <div class="legend-item"><span class="legend-dot" style="background:#4f8ef7"></span>Q1 — 13.1%</div>
            <div class="legend-item"><span class="legend-dot" style="background:#22d3a5"></span>Q2 — 28.6%</div>
            <div class="legend-item"><span class="legend-dot" style="background:#f7c94f"></span>Q3 — 28%</div>
            <div class="legend-item"><span class="legend-dot" style="background:#6ee7f7"></span>Q4 — 30.3%</div>
          </div>
        </div>
        <div class="flex items-center gap-8 mt-20">
          <div>
            <div class="stat-value" style="font-size:1.4rem">$120</div>
            <div class="text-sm text-muted mt-4">Avg. payment</div>
          </div>
          <button class="btn btn-primary btn-sm" style="margin-left:auto">Payment Details</button>
        </div>
      </div>
    </div>

    <!-- BOTTOM ROW -->
    <div class="grid-2">
      <!-- RECENT ORDERS -->
      <div class="card">
        <div class="card-header">
          <div class="card-title">Recent Orders</div>
          <a href="orders.html" class="btn btn-ghost btn-sm">View All</a>
        </div>
        <div class="table-wrap">
          <table>
            <thead><tr>
              <th>Order</th><th>Customer</th><th>Amount</th><th>Status</th>
            </tr></thead>
            <tbody>
              <tr>
                <td><span class="font-mono text-accent">#CX-1042</span></td>
                <td><strong>Alex Mercer</strong></td>
                <td><strong>$320.00</strong></td>
                <td><span class="badge badge-success">Delivered</span></td>
              </tr>
              <tr>
                <td><span class="font-mono text-accent">#CX-1041</span></td>
                <td><strong>Priya Shah</strong></td>
                <td><strong>$89.50</strong></td>
                <td><span class="badge badge-warning">Pending</span></td>
              </tr>
              <tr>
                <td><span class="font-mono text-accent">#CX-1040</span></td>
                <td><strong>Liam Torres</strong></td>
                <td><strong>$154.00</strong></td>
                <td><span class="badge badge-info">Processing</span></td>
              </tr>
              <tr>
                <td><span class="font-mono text-accent">#CX-1039</span></td>
                <td><strong>Nina Okafor</strong></td>
                <td><strong>$211.00</strong></td>
                <td><span class="badge badge-success">Delivered</span></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <!-- TOP PRODUCTS -->
      <div class="card">
        <div class="card-header">
          <div class="card-title">Top Products</div>
          <a href="products.html" class="btn btn-ghost btn-sm">View All</a>
        </div>
        <div style="display:flex;flex-direction:column;gap:16px">
          <div id="topProd1" class="top-prod-item"></div>
          <div id="topProd2" class="top-prod-item"></div>
          <div id="topProd3" class="top-prod-item"></div>
          <div id="topProd4" class="top-prod-item"></div>
        </div>
      </div>
    </div>

  </div>
</main>

<div id="toast"></div>
<script src="${pageContext.request.contextPath}/javaScript/App.js"></script>
<script src="${pageContext.request.contextPath}/javaScript/Sidebar.js"></script>
<script>
const topProducts = [
  { name: 'Apex Controller Pro', category: 'Controllers', sales: 340, pct: 85, color: '#4f8ef7' },
  { name: 'Nexa Headset X1', category: 'Audio', sales: 272, pct: 68, color: '#22d3a5' },
  { name: 'VortexPad RGB', category: 'Accessories', sales: 198, pct: 50, color: '#f7c94f' },
  { name: 'StrikeBoard Mech', category: 'Keyboards', sales: 156, pct: 39, color: '#6ee7f7' },
];
topProducts.forEach((p, i) => {
  const el = document.getElementById('topProd' + (i + 1));
  el.innerHTML = `
    <div class="flex items-center gap-12">
      <div class="avatar" style="background:linear-gradient(135deg,${p.color}55,${p.color}22);color:${p.color};border-radius:10px;width:38px;height:38px;font-size:16px">🎮</div>
      <div style="flex:1;min-width:0">
        <div class="flex justify-between mb-4"><strong style="font-size:.83rem">${p.name}</strong><span class="text-sm font-mono text-accent">${p.sales}</span></div>
        <div class="text-xs text-muted mb-4">${p.category}</div>
        <div class="progress"><div class="progress-bar" style="width:${p.pct}%;background:linear-gradient(90deg,${p.color},${p.color}99)"></div></div>
      </div>
    </div>`;
});

function initCharts() {
  drawLineChart('lineChart',
    [
      { data: [12, 18, 22, 28, 35, 31, 40], color: '#4f8ef7' },
      { data: [8,  14, 17, 22, 28, 25, 33], color: '#6ee7f7' },
      { data: [5,  9,  11, 16, 20, 18, 24], color: '#22d3a5' },
    ],
    ['Jan','Feb','Mar','Apr','May','Jun','Jul']
  );
  drawDonut('donutChart', [
    { value: 13.1, color: '#4f8ef7' },
    { value: 28.6, color: '#22d3a5' },
    { value: 28,   color: '#f7c94f' },
    { value: 30.3, color: '#6ee7f7' },
  ]);
}
initCharts();
</script>
</body>
</html>