// ── TOAST ──
function showToast(msg, duration = 2800) {
  const t = document.getElementById('toast');
  if (!t) return;
  t.textContent = msg;
  t.style.display = 'block';
  clearTimeout(t._timer);
  t._timer = setTimeout(() => { t.style.display = 'none'; }, duration);
}

// ── MODAL ──
function openModal(id) {
  const m = document.getElementById(id);
  if (m) m.classList.add('open');
}
function closeModal(id) {
  const m = document.getElementById(id);
  if (m) m.classList.remove('open');
}
document.addEventListener('click', e => {
  if (e.target.classList.contains('modal-overlay')) {
    e.target.classList.remove('open');
  }
});

// ── ACTIVE NAV ──
(function () {
  const path = location.pathname.split('/').pop() || 'index.html';
  document.querySelectorAll('.nav-item').forEach(a => {
    const href = (a.getAttribute('href') || '').split('/').pop();
    if (href === path) a.classList.add('active');
  });
})();

// ── CANVAS LINE CHART ──
function drawLineChart(canvasId, datasets, labels) {
  const canvas = document.getElementById(canvasId);
  if (!canvas) return;
  const ctx = canvas.getContext('2d');
  const W = canvas.width = canvas.offsetWidth;
  const H = canvas.height = canvas.offsetHeight;
  const pad = { top: 18, right: 18, bottom: 36, left: 36 };
  const cw = W - pad.left - pad.right;
  const ch = H - pad.top - pad.bottom;

  ctx.clearRect(0, 0, W, H);

  const allVals = datasets.flatMap(d => d.data);
  const minV = Math.min(...allVals) * .85;
  const maxV = Math.max(...allVals) * 1.1;
  const range = maxV - minV || 1;

  const xStep = cw / (labels.length - 1);
  const yScale = v => pad.top + ch - ((v - minV) / range) * ch;
  const xScale = i => pad.left + i * xStep;

  // Grid lines
  ctx.strokeStyle = 'rgba(79,142,247,0.08)';
  ctx.lineWidth = 1;
  for (let i = 0; i <= 4; i++) {
    const y = pad.top + (ch / 4) * i;
    ctx.beginPath(); ctx.moveTo(pad.left, y); ctx.lineTo(pad.left + cw, y); ctx.stroke();
  }

  // X labels
  ctx.fillStyle = 'rgba(143,163,204,0.7)';
  ctx.font = '11px Sora, sans-serif';
  ctx.textAlign = 'center';
  labels.forEach((l, i) => ctx.fillText(l, xScale(i), H - 8));

  // Dataset lines
  const colors = ['#4f8ef7', '#6ee7f7', '#22d3a5'];
  datasets.forEach((ds, di) => {
    const color = ds.color || colors[di % colors.length];

    // Gradient fill
    const grad = ctx.createLinearGradient(0, pad.top, 0, pad.top + ch);
    grad.addColorStop(0, color.replace(')', ',0.22)').replace('rgb', 'rgba'));
    grad.addColorStop(1, 'rgba(15,21,53,0)');

    ctx.beginPath();
    ds.data.forEach((v, i) => {
      i === 0 ? ctx.moveTo(xScale(i), yScale(v)) : ctx.lineTo(xScale(i), yScale(v));
    });
    ctx.lineTo(xScale(ds.data.length - 1), pad.top + ch);
    ctx.lineTo(xScale(0), pad.top + ch);
    ctx.closePath();
    ctx.fillStyle = grad;
    ctx.fill();

    // Line
    ctx.beginPath();
    ctx.strokeStyle = color;
    ctx.lineWidth = 2.5;
    ctx.lineJoin = 'round';
    ds.data.forEach((v, i) => {
      i === 0 ? ctx.moveTo(xScale(i), yScale(v)) : ctx.lineTo(xScale(i), yScale(v));
    });
    ctx.stroke();

    // Dots
    ds.data.forEach((v, i) => {
      ctx.beginPath();
      ctx.arc(xScale(i), yScale(v), 4, 0, Math.PI * 2);
      ctx.fillStyle = color;
      ctx.fill();
      ctx.strokeStyle = '#0f1535';
      ctx.lineWidth = 2;
      ctx.stroke();
    });
  });
}

// ── BAR CHART ──
function drawBarChart(canvasId, data, labels, color = '#4f8ef7') {
  const canvas = document.getElementById(canvasId);
  if (!canvas) return;
  const ctx = canvas.getContext('2d');
  const W = canvas.width = canvas.offsetWidth;
  const H = canvas.height = canvas.offsetHeight;
  const pad = { top: 16, right: 16, bottom: 36, left: 40 };
  const cw = W - pad.left - pad.right;
  const ch = H - pad.top - pad.bottom;
  ctx.clearRect(0, 0, W, H);

  const maxV = Math.max(...data) * 1.15;
  const barW = (cw / data.length) * .5;
  const gap = cw / data.length;

  ctx.strokeStyle = 'rgba(79,142,247,0.08)';
  ctx.lineWidth = 1;
  for (let i = 0; i <= 4; i++) {
    const y = pad.top + (ch / 4) * i;
    ctx.beginPath(); ctx.moveTo(pad.left, y); ctx.lineTo(pad.left + cw, y); ctx.stroke();
    ctx.fillStyle = 'rgba(143,163,204,0.6)';
    ctx.font = '10px Sora';
    ctx.textAlign = 'right';
    ctx.fillText(Math.round(maxV - (maxV / 4) * i).toLocaleString(), pad.left - 5, y + 3);
  }

  data.forEach((v, i) => {
    const x = pad.left + gap * i + (gap - barW) / 2;
    const barH = (v / maxV) * ch;
    const y = pad.top + ch - barH;

    const grad = ctx.createLinearGradient(0, y, 0, pad.top + ch);
    grad.addColorStop(0, color);
    grad.addColorStop(1, color.replace(')', ',0.4)').replace('rgb', 'rgba'));
    ctx.fillStyle = grad;
    ctx.beginPath();
    ctx.roundRect(x, y, barW, barH, [4, 4, 0, 0]);
    ctx.fill();

    ctx.fillStyle = 'rgba(143,163,204,0.7)';
    ctx.font = '10px Sora';
    ctx.textAlign = 'center';
    ctx.fillText(labels[i], x + barW / 2, H - 8);
  });
}

// ── DONUT CHART ──
function drawDonut(svgId, segments) {
  const svg = document.getElementById(svgId);
  if (!svg) return;
  const cx = 70, cy = 70, r = 52, stroke = 22;
  const total = segments.reduce((a, s) => a + s.value, 0);
  let offset = -Math.PI / 2;

  svg.innerHTML = '';
  segments.forEach(seg => {
    const angle = (seg.value / total) * Math.PI * 2;
    const x1 = cx + r * Math.cos(offset);
    const y1 = cy + r * Math.sin(offset);
    const x2 = cx + r * Math.cos(offset + angle);
    const y2 = cy + r * Math.sin(offset + angle);
    const large = angle > Math.PI ? 1 : 0;
    const d = `M ${x1} ${y1} A ${r} ${r} 0 ${large} 1 ${x2} ${y2}`;
    const path = document.createElementNS('http://www.w3.org/2000/svg', 'path');
    path.setAttribute('d', d);
    path.setAttribute('fill', 'none');
    path.setAttribute('stroke', seg.color);
    path.setAttribute('stroke-width', stroke);
    path.setAttribute('stroke-linecap', 'round');
    svg.appendChild(path);
    offset += angle;
  });
}

window.addEventListener('resize', () => {
  if (typeof initCharts === 'function') initCharts();
});