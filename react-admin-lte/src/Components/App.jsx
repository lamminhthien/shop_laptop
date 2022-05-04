import { useState } from "react";
import {
  FcPrevious,
  FcOrganization,
  FcBarChart,
  FcAssistant,
  FcBusinessman,
  FcCalendar,
  FcSearch,
  FcFolder,
  FcSettings
} from 'react-icons/fc';
const App = () => {
  const [open, setOpen] = useState(true);
  const Menus = [
    { title: "Dashboard", icon: <FcOrganization size={30} />},
    { title: "Inbox", icon: <FcAssistant size={30}/> },
    { title: "Accounts", icon: <FcBusinessman size={30}/>, },
    { title: "Schedule ", icon: <FcCalendar size={30}/> },
    { title: "Search", icon: <FcSearch size={30}/> },
    { title: "Analytics", icon: <FcBarChart size={30} /> },
    { title: "Files ", icon: <FcFolder size={30}/>},
    { title: "Setting", icon: <FcSettings size={30}/> },
  ];

  return (
    <div className="flex">
      <div
        className={` ${
          open ? "w-72" : "w-20 "
        } bg-dark-purple h-screen p-5  pt-8 relative duration-300`}
      >
        <FcPrevious size={70} 
          className={`absolute cursor-pointer right-1 top-7 w-10 border-light-green
          border-2 rounded-full  ${!open && "rotate-180"}`}
          onClick={() => setOpen(!open)}
        />
        <div className="flex gap-x-4 items-center">
          <FcOrganization size={80}
           
            className={`cursor-pointer duration-500 ${
              open && "rotate-[360deg]"
            }`}
          />
          <h1
            className={`text-white origin-left font-medium text-xl duration-200 ${
              !open && "scale-0"
            }`}
          >
            Designer
          </h1>
        </div>
        <ul className="pt-6">
          {Menus.map((Menu, index) => (
            <li
              key={index}
              className={`flex  rounded-md p-2 cursor-pointer hover:bg-light-white text-gray-300 text-sm items-center gap-x-4 
              ${Menu.gap ? "mt-9" : "mt-2"} ${
                index === 0 && "bg-light-white"
              } `}
            >
              {Menu.icon}
              <span className={`${!open && "hidden"} origin-left duration-200`}>
                {Menu.title}
              </span>
            </li>
          ))}
        </ul>
      </div>
      <div className="h-screen flex-1 p-7">
        <h1 className="text-2xl font-semibold ">Home Page</h1>
      </div>
    </div>
  );
};
export default App;