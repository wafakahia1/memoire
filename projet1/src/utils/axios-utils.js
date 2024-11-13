import axios from 'axios';

const Interceptor = axios.create({
  baseURL: 'http://localhost:8090',
  timeout: 10000, // Reduced to 10 seconds for quicker timeout
  headers: {
    'Content-Type': 'application/json',
    // You can add other common headers here if needed
  },
});

export default Interceptor;
