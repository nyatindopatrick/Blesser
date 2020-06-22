import React, { useState } from 'react';
import axios from 'axios';

export default function Login() {
  const [inputs, setInputs] = useState(null);
  const [response, setResponse] = useState(null);

  const submitForm = async (e) => {
    e.preventDefault();
    const submitter = await axios.post('/api/v1/sessions', inputs);
    setResponse(submitter.data);
  };

  const inputChange = async (e) => {
    e.preventDefault();
    const { name, value, files } = e.target;
    setInputs({ ...inputs, [name]: value });
    console.log(inputs);
  };

  console.log(response);
  return (
    <form onSubmit={submitForm} className=''>
      <input type='email' name='email' onChange={inputChange} />
      <input type='password' name='password' onChange={inputChange} />
      <button type='submit'>Submit</button>
    </form>
  );
}
