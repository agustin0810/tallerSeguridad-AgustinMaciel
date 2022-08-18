import '../App.css';
import React, { useState } from 'react';

import { Container, Typography, TextField, Button, Alert } from '@mui/material';


function Register() {
  const[show, setShow] = useState(false)
  const[error, setError] = useState("")
  const [user, setUser] = useState("")
  const [password, setPassword] = useState("")
  const [confPassword, setConfPassword] = useState("")

  const checkMayus = (password) =>{
    let cont = 0;
    for (var i = 0; i < password.length; i++) {
      if(password.charAt(i).toUpperCase()===password.charAt(i)){
        cont = 1
      }
    }
    if(cont == 1)
      return true;
    return false
  }

  function checkFields(){
    if(user!="", password!=""){

      if (password.length>10 && checkMayus(password) && password===confPassword)
        return true;
      return false;
    }
    return false;
  }
  function registrarse(){

    if(checkFields()){
      let registro = {"user": user, "password": password}
      fetch('http://localhost:5000/registro', {method: 'POST', body: JSON.stringify(registro), // data can be `string` or {object}!
      headers:{
        'Content-Type': 'application/json'
      }})
      .then(
        response => response.json(), //ADDED >JSON() HERE
    
        error => console.log('An error occurred.', error)
      )
      setError('')
      setShow(true)
    }
    else{
      setShow(true)
      setError("Campos ingresados inválidos")
    }

  }

  return (
    <div className="App">
      <Container maxWidth="sm" style={{backgroundColor: "#75C270", borderRadius: 10, marginTop: 100, display: 'inline-block' }}>
        <Typography mt={4} style={{marginTop: '30px', fontFamily: 'arial', fontSize: 40, color: '#43903E'}}> REGISTRARSE </Typography>
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
            style={{marginTop: 10, backgroundColor: '#AEDBAA', float: 'left', marginLeft: 50}}
        />
        <TextField
            id="pass"
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
            style={{marginTop: 10, backgroundColor: '#AEDBAA', float: 'left', marginLeft: 50}}
        />
        <TextField
            id="confPassword"
            label="Confirmar contraseña"
            type="password"
            InputLabelProps={{
              shrink: true,
              style: {
                color: '#43903E'
              }
            }}
            onChange={event => {
              const { value } = event.target;
              setConfPassword(value)
            }}
            variant="outlined"
            style={{marginTop: 10, backgroundColor: '#AEDBAA'}}
        />

        <Button variant="outlined" style={{display: 'block', position: 'relative', margin: 'auto', color: 'white', borderColor: 'white', marginTop: 20, marginBottom: 10}} onClick={registrarse}>Registrarse</Button>   

        {console.log(error)}
        {show ? error=="" ? <Alert severity="success" style={{marginBottom: 30, width: '40%', position: 'relative', margin: 'auto'}}>{"Registro exitoso"}</Alert>: <Alert severity="error" style={{marginBottom: 30, width: '40%', position: 'relative', margin: 'auto'}}>{error}</Alert>: <p></p>}

        </Container>
    </div>
  );
}

export default Register;
