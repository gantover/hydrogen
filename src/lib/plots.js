import Plotly from 'plotly.js-dist-min';

export const createPlot = (el, res, size,xaxis_name) => {
  const trace = {
    x: res.range,
    y: res.values,
    name: res.legend,
  }
  const layout = {
    width: size.w-4, height: size.h-4, 
    margin: { l: 40, r: 20, b: 20, t: 20 },
    showlegend: true,
    legend: {
      xanchor: 'right',
    },
    xaxis: {
      title: {
        text: xaxis_name,
        font: {
          family: 'Courier New, monospace',
          size: 18,
          color: '7f7f7f'
        },
      },
    },
  }
  Plotly.newPlot(el, [trace], layout);
}

