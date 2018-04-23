
Public Class GridDataItem
    Public Property ID() As Integer
        Get
            Return m_ID
        End Get
        Set
            m_ID = Value
        End Set
    End Property
    Private m_ID As Integer
    Public Property C1() As Integer
        Get
            Return m_C1
        End Get
        Set
            m_C1 = Value
        End Set
    End Property
    Private m_C1 As Integer
    Public Property C2() As Double
        Get
            Return m_C2
        End Get
        Set
            m_C2 = Value
        End Set
    End Property
    Private m_C2 As Double
    Public Property C3() As String
        Get
            Return m_C3
        End Get
        Set
            m_C3 = Value
        End Set
    End Property
    Private m_C3 As String
    Public Property C4() As Boolean
        Get
            Return m_C4
        End Get
        Set
            m_C4 = Value
        End Set
    End Property
    Private m_C4 As Boolean
    Public Property C5() As DateTime
        Get
            Return m_C5
        End Get
        Set
            m_C5 = Value
        End Set
    End Property
    Private m_C5 As DateTime

    Public Shared Function GetData() As List(Of GridDataItem)
        Dim key = "34FAA431-CF79-4869-9488-93F6AAE81263"
        If HttpContext.Current.Session(key) Is Nothing Then
            HttpContext.Current.Session(key) = Enumerable.Range(0, 100).[Select](Function(i) New GridDataItem() With {
                .ID = i,
                .C1 = i Mod 2,
                .C2 = i * 0.5 Mod 3,
                .C3 = String.Format("C3 {0}", i),
                .C4 = i Mod 2 = 0,
                .C5 = New DateTime(2013 + i, 12, 16)
            }).ToList()
        End If
        Return DirectCast(HttpContext.Current.Session(key), List(Of GridDataItem))
    End Function
End Class
