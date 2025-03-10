using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class Response_Warehouse
    {
        public Response_Warehouse(Склады склады)
        {
            IDСклада = склады.IDСклада;
            Название = склады.Название;
            Адрес = склады.Адрес;
            ТипСклада = склады.ТипСклада;
            ЗонаХранения = склады.ЗонаХранения;
            IDТовара = склады.IDТовара;
            Количество = склады.Количество;
           



        }
        public int IDСклада { get; set; }
        public string Название { get; set; }
        public string Адрес { get; set; }
        public string ТипСклада { get; set; }
        public string ЗонаХранения { get; set; }
        public Nullable<int> IDТовара { get; set; }
        public Nullable<int> Количество { get; set; }
    }
}