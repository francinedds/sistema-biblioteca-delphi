unit view.cadastro.livros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Data.DB, service.conexao;

type
  TViewCadastroLivros = class(TForm)
    pnlHeader: TPanel;
    pnlFooter: TPanel;
    pnlTitle: TPanel;
    lblTitle: TLabel;
    pnlContent: TPanel;
    btnClose: TSpeedButton;
    lblTitulo: TLabel;
    edtTitulo: TEdit;
    lblAutor: TLabel;
    edtAutor: TEdit;
    lblAno: TLabel;
    edtAno: TEdit;
    pnlBtnSalvar: TPanel;
    btnSalvar: TSpeedButton;
    ComboBox: TComboBox;
    lblStatus: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure pnlHeaderMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewCadastroLivros: TViewCadastroLivros;

implementation

{$R *.dfm}

procedure TViewCadastroLivros.btnCloseClick(Sender: TObject);
begin
 Self.Close;
end;

procedure TViewCadastroLivros.btnSalvarClick(Sender: TObject);
begin // cadastrar livros
  ServiceConexao.FDquery_CadastrarLivros.SQL.Text := 'INSERT INTO Livros (liv_titulo, liv_autor, liv_ano_publicacao, liv_status) VALUES (:titulo, :autor, :ano, :status)';
  ServiceConexao.FDquery_CadastrarLivros.ParamByName('titulo').AsString := edtTitulo.Text;
  ServiceConexao.FDquery_CadastrarLivros.ParamByName('autor').AsString := edtAutor.Text;
  ServiceConexao.FDquery_CadastrarLivros.ParamByName('ano').AsInteger := StrToInt(edtAno.Text);
  ServiceConexao.FDquery_CadastrarLivros.ParamByName('status').AsString := ComboBox.Text; // Novo livro é disponível

  ServiceConexao.FDquery_CadastrarLivros.ExecSQL;
  ShowMessage('Livro cadastrado com sucesso!');
end;


procedure TViewCadastroLivros.pnlHeaderMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
   sc_DragMove = $f012;
begin
  ReleaseCapture;
  Perform(wm_SysCommand, sc_DragMove, 0);
end;

end.
