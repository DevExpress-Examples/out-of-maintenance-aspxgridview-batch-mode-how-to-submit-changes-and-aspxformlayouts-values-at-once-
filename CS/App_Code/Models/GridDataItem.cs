
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;

public class GridDataItem {
    public int ID { get; set; }
    public int C1 { get; set; }
    public double C2 { get; set; }
    public string C3 { get; set; }
    public bool C4 { get; set; }
    public DateTime C5 { get; set; }
}

public static class DataProvider
{
    public static List<GridDataItem> GetData()
    {
        var key = "34FAA431-CF79-4869-9488-93F6AAE81263";
        if (HttpContext.Current.Session[key] == null)
            HttpContext.Current.Session[key] = Enumerable.Range(0, 100).Select(i => new GridDataItem
            {
                ID = i,
                C1 = i % 2,
                C2 = i * 0.5 % 3,
                C3 = "C3 " + i,
                C4 = i % 2 == 0,
                C5 = new DateTime(2013 + i, 12, 16)
            }).ToList();
        return (List<GridDataItem>)HttpContext.Current.Session[key];
    }

    public static GridDataItem UpdateItem(OrderedDictionary keys, OrderedDictionary newValues)
    {
        var id = Convert.ToInt32(keys["ID"]);
        var item = GetData().First(i => i.ID == id);
        LoadNewValues(item, newValues);
        return item;
    }

    private static void LoadNewValues(GridDataItem item, OrderedDictionary values)
    {
        item.C1 = Convert.ToInt32(values["C1"]);
        item.C2 = Convert.ToDouble(values["C2"]);
        item.C3 = Convert.ToString(values["C3"]);
        item.C4 = Convert.ToBoolean(values["C4"]);
        item.C5 = Convert.ToDateTime(values["C5"]);
    }
}