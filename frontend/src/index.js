import ReactDOM from "react-dom/client";
import {
  BrowserRouter,
  Routes,
  Route,
} from "react-router-dom";
import App from './App'
import CreatePromo from './pages/createPromo'
import Register from './pages/register'

const root = ReactDOM.createRoot(
  document.getElementById("root")
);
root.render(
  <BrowserRouter>
    <Routes>
      <Route path="/" element={<App />}>
      </Route>
      <Route path="/createPromo" element={<CreatePromo />}>
      </Route>
      <Route path="/register" element={<Register />}>
      </Route>
    </Routes>
  </BrowserRouter>
);