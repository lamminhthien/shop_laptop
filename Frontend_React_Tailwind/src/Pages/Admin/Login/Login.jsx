import axios from 'axios';
import { FcElectricalSensor } from 'react-icons/fc';
import LoginJWT from '../../../Api/LoginJWT';
import { useState } from 'react';
export default function LoginCreateJWT(props) {
  var [isLogin,setIsLogin] =  useState("")
  const handleSubmit = e => {
    e.preventDefault();
    const username = e.target[0].value;
    const password = e.target[1].value;
    if(LoginJWT(username, password)){
      setIsLogin(1)
    } else {
      setIsLogin(<h3> Tài khoản không hợp lệ</h3>)
    }
  };
  // const isLoginMessage = (isLogin) =>{
  //   console.log("Go to this function");
  //   if (isLogin === -1 ){
  //     return ""
  //   } else  if (isLogin === 0)
  //   return <h3 className=''>Tài khoản không hợp lệ</h3>
  // }
console.log(props);
  // Render form
    return (
      <div
        class='body-bg min-h-screen pt-12 md:pt-20 pb-6 px-2 md:px-0 bg-gradient-to-r
      from-indigo-600
      to-blue-400'>
        <main class='bg-white max-w-lg mx-auto p-8 md:p-12 my-10 rounded-lg shadow-2xl'>
          <section>
            {props.expire? <h3 className='text-red-600'>Phiên đăng nhập hết hạn</h3> :
            ""
            }
             {props.login? <h3 className='text-red-600'>Bạn chưa đăng nhập</h3> :
            ""
            }
            {isLogin}
            <h3 class='font-bold text-2xl text-center'>Chào mừng nhân viên Đức Thịnh Laptop</h3>
          </section>

          <section class='mt-10'>
            <form class='flex flex-col' method='POST' action='#' onSubmit={e => handleSubmit(e)}>
              <div class='mb-6 pt-3 rounded bg-gray-200'>
                <label class='block text-gray-700 text-sm font-bold mb-2 ml-3' for='email'>
                  Username
                </label>
                <input
                  type='text'
                  name='Username'
                  class='bg-gray-200 rounded w-full text-gray-700 focus:outline-none border-b-4 border-gray-300 focus:border-purple-600 transition duration-500 px-3 pb-3'
                />
              </div>
              <div class='mb-6 pt-3 rounded bg-gray-200'>
                <label class='block text-gray-700 text-sm font-bold mb-2 ml-3' for='password'>
                  Mật khẩu
                </label>
                <input
                  type='password'
                  name='Password'
                  class='bg-gray-200 rounded w-full text-gray-700 focus:outline-none border-b-4 border-gray-300 focus:border-purple-600 transition duration-500 px-3 pb-3'
                />
              </div>
              <button
                class='bg-purple-600 hover:bg-purple-700 text-white font-bold py-2 rounded shadow-lg hover:shadow-xl transition duration-200'
                type='submit'>
                Đăng nhập
              </button>
            </form>
          </section>
        </main>
      </div>
    );
  }

