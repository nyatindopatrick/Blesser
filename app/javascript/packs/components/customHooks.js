import React, { useState } from 'react';
import axios from 'axios';

export const inputHandler = (url) => {
  const [inputs, setInputs] = useState(null);
  const [uploads, setUploads] = useState(null);
  const [response, setResponse] = useState(null);

  //   track and update changes in input fields
  const inputChange = async (e) => {
    const { name, value, files } = e.target;
    setInputs({ ...inputs, [name]: value });
    console.log(inputs);
  };

  //   for image uploads
  const uploadsChange = async (e) => {
    const { files } = e.target;
    setUploads({ image: files[0] });
    return uploads;
  };

  //   for submitting the form data to the server
  const onSubmit = async (url) => {
    if (uploads) {
      let data = new FormData();
      data.append('image', uploads);
      data.set('data', inputs);

      axios
        .post('url', data)
        .then((response) => console.log(response))
        .catch((error) => console.log(error));
    }
  };

  return {
    inputChange,
    uploadsChange,
    onSubmit,
  };
};
