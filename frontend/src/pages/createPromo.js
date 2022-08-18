import '../App.css';
import React, { useState } from 'react';
import UploadFileIcon from "@mui/icons-material/UploadFile";

import { Container, Typography, TextField, Button, Alert } from '@mui/material';
import { ReactSession } from 'react-client-session';

function CreatePromo() {
  const [title, setTitle] = useState('');
  const [value, setValue] = useState(0);
  const [discount, setDiscount] = useState(0);
  const [message, setMessage] = useState('');
  const[show, setShow] = useState(false)
  const[error, setError] = useState("")
  const [selectedFile, setSelectedFile] = useState();
  const [formData, setFormData] = useState(null);
  const [description, setDescription] = useState("")
  const[alerta, setAlerta] = useState("")

  ReactSession.setStoreType("localStorage");
	const handleFileUpload = (event) => {
    setSelectedFile(event.target.files[0]);
		const formDataImg = new FormData();
    formDataImg.append('file', selectedFile);
    setFormData(selectedFile.files[0])
    /*
		fetch(
			"https://freeimage.host/api/1/upload?key="+process.env.REACT_APP_FI_API_KEY,
			{
				method: 'POST',
				body: formData,
			}
		)
			.then((response) => response.json())
			.then((result) => {
				console.log('Success:', result);
			})
			.catch((error) => {
				console.error('Error:', error);
			});
    */
	};

  function checkFields(){
    if(title!="", value!="", discount!=""){

      var numbers = /^[0-9]+$/;
      if (value.match(numbers) && discount.match(numbers))
        return true;
      return false;
    }
    return false;
  }
  function ingresar(){

   
    if(checkFields()){

      let userSession = ReactSession.get('user')
      let promo = {"title": title, "value": value, "discount": discount, "formData": formData, "description": description, "userSession": userSession}

      fetch('http://localhost:5000/addPromo', {method: 'POST', body: JSON.stringify(promo), // data can be `string` or {object}!
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
        }
      })
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
      
      <Container maxWidth="sm" style={{backgroundColor: "#377AC8", borderRadius: 10, marginTop: 100, display: 'inline-block' }}>
        <Typography mt={4} style={{marginTop: '30px', fontSize: 40, color: 'black'}}> Crear promoción </Typography>
        <TextField
            id="title"
            label="Titulo"
            type="text"
            InputLabelProps={{
              shrink: true,
            }}
            onChange={event => {
              const { value } = event.target;
              setTitle(value)
            }}
            variant="standard"
            style={{marginTop: 20, marginBottom: 10, position: 'relative', float: 'left', marginLeft: 70}}
        />
        <TextField
            id="value"
            label="Precio"
            type="number"
            InputLabelProps={{
              shrink: true,
            }}
            onChange={event => {
              const { value } = event.target;
              setValue(value)
            }}
            variant="standard"
            style={{marginTop: 20, marginBottom: 10, float: 'left', marginLeft: 10}}
        />
        <TextField
            id="discount"
            label="Porcentaje descuento"
            type="number"
            InputLabelProps={{
              shrink: true,
            }}
            onChange={event => {
              const { value } = event.target;
              setDiscount(value)
            }}
            variant="standard"
            style={{marginTop: 20, marginBottom: 10, float: 'left', marginLeft: 70}}
        />
        <Button
        component="label"
        variant="outlined"
        startIcon={<UploadFileIcon />}
        sx={{ marginRight: "1rem" }}
        style={{marginTop: 30, marginBottom: 8, float: 'left', color: 'white', border: 'black', marginLeft: 10}}

        >
        Subir imagen (png)
        <input type="file" accept=".png" hidden onChange={handleFileUpload} />
        </Button>

        <TextField
          placeholder="Descripción de la oferta (producto, detalles, etc)"
          multiline
          rows={2}
          maxRows={4}
          onChange={event => {
            const { value } = event.target;
            setDescription(value)
          }}
          variant="standard"
          style={{color: 'white', borderColor: 'white', position: 'relative', margin: 'auto', left: -170, top: 10, bottom: 20}}
        />
        <Button variant="outlined" style={{position: 'relative', color: 'white', borderColor: 'white', float: 'left', marginTop: 100, marginLeft: -50, marginBottom: 10}} onClick={ingresar}>Ingresar</Button>   

        {show ? alerta!="" ? <Alert severity="success">{alerta}</Alert>: <Alert severity="error">{error}</Alert>: <p></p>}
        {console.log(show)}
        {console.log(alerta)}
        {console.log(error)}
        </Container>
    </div>
  );
}

export default CreatePromo;
