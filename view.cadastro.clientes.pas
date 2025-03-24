unit view.cadastro.clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  service.conexao;

type
  TViewCadastroClientes = class(TForm)
    pnlContent: TPanel;
    lblNome: TLabel;
    lblTelefone: TLabel;
    lblEmail: TLabel;
    edtNomeCompleto: TEdit;
    edtTelefone: TEdit;
    edtEmail: TEdit;
    pnlBtnSalvar: TPanel;
    btnSalvar: TSpeedButton;
    pnlFooter: TPanel;
    pnlHeader: TPanel;
    btnClose: TSpeedButton;
    pnlTitle: TPanel;
    lblTitle: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure pnlHeaderMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewCadastroClientes: TViewCadastroClientes;

implementation

{$R *.dfm}

procedure TViewCadastroClientes.btnCloseClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TViewCadastroClientes.btnSalvarClick(Sender: TObject);
begin // cadastrar clientes
  ServiceConexao.FDQuery_CadastrarClientes.SQL.Text := 'INSERT INTO Pessoas (pes_nomecompleto, pes_telefone, pes_email) VALUES (:nome, :telefone, :email)';
  ServiceConexao.FDQuery_CadastrarClientes.ParamByName('nome').AsString := edtNomeCompleto.Text;
  ServiceConexao.FDQuery_CadastrarClientes.ParamByName('telefone').AsString := edtTelefone.Text;
  ServiceConexao.FDQuery_CadastrarClientes.ParamByName('email').AsString := edtEmail.Text;

  ServiceConexao.FDQuery_CadastrarClientes.ExecSQL;
  ShowMessage('Cliente cadastrado com sucesso!');
end;

procedure TViewCadastroClientes.pnlHeaderMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
   sc_DragMove = $f012;
begin
  ReleaseCapture;
  Perform(wm_SysCommand, sc_DragMove, 0);
end;

end.
