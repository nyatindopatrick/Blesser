import React, { useState, useEffect } from 'react';
import axios from 'axios';
import * as timeago from 'timeago.js';

export default function Home() {
  const [blessings, setBlessings] = useState(null);
  useEffect(() => {
    axios
      .get('/api/v1/blessings')
      .then((response) => {
        setBlessings(response.data);
      })
      .catch((err) => console.error(err));
  }, []);

  console.log(blessings);
  return (
    <div className='home row container-fluid mx-auto justify-content-around'>
      <div className='col-lg-3 col-md-3 col-11'></div>
      <div className='feeds col-lg-6 col-md-6 col-11'>
        {blessings &&
          blessings.map((item, i) => {
            const { content, location, updated_at, image, kind } = item;
            return (
              <div className='post' key={i}>
                <div className='name-header d-flex'>
                  <div className='avatar'>{item.user.name[0]}</div>
                  <div>
                    <h5>{item.user.name}</h5>
                    <p>{location}</p>
                    <p>{timeago.format(updated_at)}</p>
                  </div>
                  <div className='post-options'>
                    <button
                      className=' dropdown-toggle'
                      type='button'
                      data-toggle='dropdown'
                      aria-haspopup='true'
                      aria-expanded='false'
                    ></button>
                    <div className='dropdown-menu dropdown-menu-right'>
                      options
                    </div>
                  </div>
                </div>
                <p>{kind}</p>
                <p>{content}</p>
                {image ? (
                  <img src={image} alt={image} className='post-image w-100' />
                ) : (
                  ''
                )}

                <div className='likes-row'>
                  <i className='like'></i>
                  <span>{item.likes.length} likes</span>
                </div>
                <hr />
              </div>
            );
          })}
      </div>
      <div className='col-lg-3 col-md-3 col-11'></div>
    </div>
  );
}
