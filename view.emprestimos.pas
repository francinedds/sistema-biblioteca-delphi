unit view.emprestimos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, service.conexao;

type
  TViewEmprestimos = class(TForm)
    pnlContent: TPanel;
    lblSelecionaCliente: TLabel;
    lblData: TLabel;
    lblSelecionaLivro: TLabel;
    pnlBtnSalvar: TPanel;
    btnSalvar: TSpeedButton;
    pnlFooter: TPanel;
    pnlHeader: TPanel;
    btnClose: TSpeedButton;
    pnlTitle: TPanel;
    lblTitle: TLabel;
    DateTimePicker: TDateTimePicker;
    ComboBoxClientes: TComboBox;
    ComboBoxLivros: TComboBox;
    procedure btnCloseClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pnlHeaderMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    function VerificarDisponibilidadeLivro(LivroID: Integer): Boolean;

    procedure CarregarLivros;
    procedure CarregarClientes;
    procedure RegistrarEmprestimo(LivroID, ClienteID: Integer; DataRetirada: TDateTime);
    procedure AtualizarStatusLivro(LivroID: Integer; Disponivel: Boolean);
  public
    { Public declarations }
  end;

var
  ViewEmprestimos: TViewEmprestimos;

implementation

{$R *.dfm}


procedure TViewEmprestimos.AtualizarStatusLivro(LivroID: Integer;
  Disponivel: Boolean);
begin // atualiza status
  ServiceConexao.FDQuery_CadastrarLivros.SQL.Text := 'UPDATE livros SET liv_status = :liv_status WHERE liv_codigo = : liv_codigo';

  if Disponivel then
    ServiceConexao.FDQuery_CadastrarLivros.ParamByName('liv_status').AsString := 'disponível'
  else
    ServiceConexao.FDQuery_CadastrarLivros.ParamByName('liv_status').AsString := 'emprestado';

  ServiceConexao.FDQuery_CadastrarLivros.ParamByName('liv_codigo').AsInteger := LivroID;
  ServiceConexao.FDQuery_CadastrarLivros.ExecSQL;
end;

procedure TViewEmprestimos.btnCloseClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TViewEmprestimos.btnSalvarClick(Sender: TObject);
var
  LivroID, ClienteID: Integer;
  DataRetirada: TDateTime;
begin
  // verificar se o livro e o cliente foram selecionados
  if ComboBoxLivros.ItemIndex = -1 then
  begin
    ShowMessage('Selecione um livro.');
    Exit;
  end;

  if ComboBoxClientes.ItemIndex = -1 then
  begin
    ShowMessage('Selecione um cliente.');
    Exit;
  end;

  // obtem os IDs dos livros e clientes selecionados
  LivroID := Integer(ComboBoxLivros.Items.Objects[ComboBoxLivros.ItemIndex]);
  ClienteID :=  ComboBoxClientes.ItemIndex + 1;

  // data de retirada é a data selecionada no DateTimePicker
  DataRetirada := DateTimePicker.Date;

  // verifica se o livro está disponível
  if not VerificarDisponibilidadeLivro(LivroID) then
  begin
    ShowMessage('Este livro não está disponível para empréstimo.');
    Exit;
  end;

  // registrar o empréstimo
  RegistrarEmprestimo(LivroID, ClienteID, DataRetirada);

  // atualiza o status do livro
  AtualizarStatusLivro(LivroID, False);

  ShowMessage('Empréstimo realizado com sucesso!');
end;

procedure TViewEmprestimos.CarregarClientes;
begin // carrega clientes
  ServiceConexao.FDQuery_CadastrarClientes.SQL.Text := 'SELECT pes_codigo, pes_nomecompleto, pes_telefone, pes_email FROM pessoas';
  ServiceConexao.FDQuery_CadastrarClientes.Open;

  ComboBoxClientes.Items.Clear;

  while not ServiceConexao.FDQuery_CadastrarClientes.Eof do
  begin
    ComboBoxClientes.Items.AddObject(ServiceConexao.FDQuery_CadastrarClientes.FieldByName('pes_nomecompleto').AsString, TObject(ServiceConexao.FDQuery_CadastrarClientes.FieldByName('pes_codigo').AsInteger));
    ServiceConexao.FDQuery_CadastrarClientes.Next;
  end;

  ServiceConexao.FDQuery_CadastrarClientes.Close;
end;

procedure TViewEmprestimos.CarregarLivros;
begin // carregar os livros
  ServiceConexao.FDQuery_CadastrarLivros.SQL.Text := 'SELECT liv_codigo, liv_titulo, liv_autor, liv_ano_publicacao, liv_status FROM livros';
  ServiceConexao.FDQuery_CadastrarLivros.Open;
  while not ServiceConexao.FDQuery_CadastrarLivros.Eof do
    begin
      ComboBoxLivros.Items.AddObject(ServiceConexao.FDQuery_CadastrarLivros.FieldByName('liv_titulo').AsString, TObject(ServiceConexao.FDQuery_CadastrarLivros.FieldByName('liv_codigo').AsInteger));
      ServiceConexao.FDQuery_CadastrarLivros.Next;
    end;
  ServiceConexao.FDQuery_CadastrarLivros.Close;
end;

procedure TViewEmprestimos.FormCreate(Sender: TObject);
begin
  // FDConnection.Params.Database := 'C:\caminho\para\seu\database.db';
  // FDConnection.Connected := True;

  // carregar livros e clientes para os ComboBoxes
  CarregarLivros;
  CarregarClientes;

  // define a data de retirada como a data atual
  DateTimePicker.Date := Now;
end;

procedure TViewEmprestimos.pnlHeaderMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
   sc_DragMove = $f012;
begin
  ReleaseCapture;
  Perform(wm_SysCommand, sc_DragMove, 0);
end;

procedure TViewEmprestimos.RegistrarEmprestimo(LivroID, ClienteID: Integer;
  DataRetirada: TDateTime);
begin // registrar o empréstimo
  ServiceConexao.FDQuery_Emprestimos.SQL.Text := 'INSERT INTO emprestimos (emp_livro, emp_cliente, emp_data_emprestimo) ' +
                      'VALUES (:emp_codigo, :emp_cliente, :emp_data_emprestimo';
  ServiceConexao.FDQuery_Emprestimos.ParamByName('emp_livro').AsInteger := LivroID;
  ServiceConexao.FDQuery_Emprestimos.ParamByName('emp_cliente').AsInteger := ClienteID;
  ServiceConexao.FDQuery_Emprestimos.ParamByName('emp_data_emprestimo').AsDateTime := DataRetirada;
  ServiceConexao.FDQuery_Emprestimos.ExecSQL;
end;

function TViewEmprestimos.VerificarDisponibilidadeLivro(
  LivroID: Integer): Boolean;
begin
  ServiceConexao.FDQuery_CadastrarLivros.SQL.Text := 'SELECT liv_status FROM livros WHERE liv_codigo = :liv_codigo';
  ServiceConexao.FDQuery_CadastrarLivros.ParamByName('liv_livro').AsInteger := LivroID;
  ServiceConexao.FDQuery_CadastrarLivros.Open;

  Result := (ServiceConexao.FDQuery_CadastrarLivros.FieldByName('liv_status').AsString = 'disponível');
  ServiceConexao.FDQuery_CadastrarLivros.Close;
end;

end.
