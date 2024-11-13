import { render, screen } from '@testing-library/react';
import App from './App';
import cornerstoneWADOImageLoader from 'cornerstone-wado-image-loader';

test('renders learn react link', () => {
  render(<App />);
  const linkElement = screen.getByText(/learn react/i);
  expect(linkElement).toBeInTheDocument();
});