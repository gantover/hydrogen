import Plotly from 'plotly.js-dist-min';

export const createPlot = (el, res, size) => {
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
  }
  Plotly.newPlot(el, [trace], layout);
}

