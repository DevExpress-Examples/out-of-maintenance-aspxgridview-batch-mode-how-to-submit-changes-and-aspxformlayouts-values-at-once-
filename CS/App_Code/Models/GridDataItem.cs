
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class GridDataItem {
    public int ID { get; set; }
    public int C1 { get; set; }
    public double C2 { get; set; }
    public string C3 { get; set; }
    public bool C4 { get; set; }
    public DateTime C5 { get; set; }

    public static List<GridDataItem> GetData() {
        var key = "34FAA431-CF79-4869-9488-93F6AAE81263";
        if (HttpContext.Current.Session[key] == null)
            HttpContext.Current.Session[key] = Enumerable.Range(0, 100).Select(i => new GridDataItem {
                ID = i,
                C1 = i % 2,
                C2 = i * 0.5 % 3,
                C3 = "C3 " + i,
                C4 = i % 2 == 0,
                C5 = new DateTime(2013 + i, 12, 16)
            }).ToList();
        return (List<GridDataItem>)HttpContext.Current.Session[key];
    }
}