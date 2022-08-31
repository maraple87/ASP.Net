Public Class page
    Inherits System.Web.UI.Page
    Dim iJahr
    Dim iMonat


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        GridView1.Visible = False
    End Sub

    Protected Sub DropDownList_procedure_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList_procedure.SelectedIndexChanged
        TextBox.Visible = False
        GridView1.Visible = False
    End Sub

    Protected Sub DropDownList_Jahr_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList_Jahr.SelectedIndexChanged
        TextBox.Visible = False
        GridView1.Visible = False
    End Sub

    Protected Sub Button_Ansicht_Detail_Click(sender As Object, e As EventArgs) Handles Button_Ansicht_Detail.Click
        Me.Session("Jahr") = Convert.ToInt32(DropDownList_Jahr.SelectedItem.Value.Substring(3))
        Me.Session("Monat") = Convert.ToInt32(DropDownList_Jahr.SelectedItem.Value.Substring(0, 2))
        Me.Session("Typ") = "AnsichtDetail"
        Me.Session("Ziel") = DropDownList_procedure.SelectedItem.Value
        Button_Uebergabe_Lucanet.Enabled = False
        TextBox.Visible = False
        GridView1.Visible = True
    End Sub

    Protected Sub Button_Ansicht_Lucanet_Click(sender As Object, e As EventArgs) Handles Button_Ansicht_Lucanet.Click
        Me.Session("Jahr") = Convert.ToInt32(DropDownList_Jahr.SelectedItem.Value.Substring(3))
        Me.Session("Monat") = Convert.ToInt32(DropDownList_Jahr.SelectedItem.Value.Substring(0, 2))
        Me.Session("Typ") = "AnsichtLucaNet"
        Me.Session("Ziel") = DropDownList_procedure.SelectedItem.Value
        Button_Uebergabe_Lucanet.Enabled = True
        TextBox.Visible = False
        GridView1.Visible = True
    End Sub

    Protected Sub Button_Uebergabe_Lucanet_Click(sender As Object, e As EventArgs) Handles Button_Uebergabe_Lucanet.Click
        Me.Session("Jahr") = Convert.ToInt32(DropDownList_Jahr.SelectedItem.Value.Substring(3))
        Me.Session("Monat") = Convert.ToInt32(DropDownList_Jahr.SelectedItem.Value.Substring(0, 2))
        Me.Session("Typ") = "UebergabeLucaNet"
        Me.Session("Ziel") = DropDownList_procedure.SelectedItem.Value
        Button_Uebergabe_Lucanet.Enabled = False
        TextBox.Visible = True
        GridView1.Visible = True
    End Sub

    Protected Sub TextBox_TextChanged(sender As Object, e As EventArgs) Handles TextBox.TextChanged

    End Sub

End Class