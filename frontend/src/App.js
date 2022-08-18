import logo from './logo.svg';
import './App.css';
import React, { useState, useEffect } from 'react';
import { ReactSession } from 'react-client-session';
import { Container, Typography, TextField, Button, Alert } from '@mui/material';

import Session from 'react-session-api'

function App() {
  const[show, setShow] = useState(false)
  const[error, setError] = useState("")
  const [user, setUser] = useState("")
  const [password, setPassword] = useState("")
  const[alerta, setAlerta] = useState("")
  useEffect(() => {
    ReactSession.remove("user");
    console.log(ReactSession.get('user'))
  }, [])
  
  ReactSession.setStoreType("localStorage");
  function checkFields(){
    if(user!="", password!=""){

      return true;
    }
    return false;
  }
  const registrarse = () =>{
    window.location.href = "http://localhost:3000/register";
  }
  function ingresar(){
    if(checkFields()){
      let login = {"user": user, "password": password}
      fetch('http://localhost:5000/login', {method: 'POST', body: JSON.stringify(login), // data can be `string` or {object}!
      headers:{
        'Content-Type': 'application/json'
      }})
      .then(
        (response) => response.json(),
      )
      .then((data) =>{
        if(data.err==true){
          setAlerta("")
          setError(data.msg)
          setShow(true)
        }
        else{
          setError("")
          setAlerta(data.msg)
          setShow(true)
          window.location.href = "http://localhost:3000/createPromo";
        }
      })
      setError('')
      setShow(true)
      ReactSession.set("user", user);
    }
    else{
      setShow(true)
      setError("Campos ingresados inválidos")
    }

  }

  return (
    <div className="App">
      <Container maxWidth="sm" style={{backgroundColor: "#75C270", borderRadius: 10, marginTop: 100, display: 'inline-block' }}>
        <Typography mt={4} style={{marginTop: '30px', fontFamily: 'arial', fontSize: 40, color: '#43903E'}}> LOGIN </Typography>
        <TextField
            id="user"
            label="Usuario"
            type="text"
            InputLabelProps={{
              shrink: true,
              style: {
                color: '#43903E'
              }
            }}
            onChange={event => {
              const { value } = event.target;
              setUser(value)
            }}
            variant="outlined"
            style={{marginTop: 20, marginBottom: 10, position: 'relative', float: 'left', marginLeft: 70, backgroundColor: '#AEDBAA'}}
        />
        <TextField
            id="password"
            label="Contraseña"
            type="password"
            InputLabelProps={{
              shrink: true,
              style: {
                color: '#43903E'
              }
            }}
            onChange={event => {
              const { value } = event.target;
              setPassword(value)
            }}
            variant="outlined"
            style={{marginTop: 20, marginBottom: 10, position: 'relative', float: 'left', marginLeft: 10, backgroundColor: '#AEDBAA'}}
        />
        <Button variant="outlined" style={{display: 'inline-block', position: 'relative', margin: 'auto', color: 'white', borderColor: 'white', marginTop: 20, marginBottom: 10}} onClick={ingresar}>Ingresar</Button>   
        <Button variant="outlined" style={{display: 'block', position: 'relative', margin: 'auto', color: 'white', borderColor: 'white', border: 'none', marginTop: 10, marginBottom: 10, fontSize: 10}} onClick={registrarse}>Registrarse</Button>  
        {console.log(error)}
        {show ? alerta!="" ? <Alert severity="success">{alerta}</Alert>: <Alert severity="error">{error}</Alert>: <p></p>}

        </Container>
    </div>
  );
}

export default App;
