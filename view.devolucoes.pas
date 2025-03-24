unit view.devolucoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, service.conexao;

type
  TViewDevolucoes = class(TForm)
    pnlContent: TPanel;
    lblData: TLabel;
    lblSelecionaLivro: TLabel;
    pnlBtnSalvar: TPanel;
    btnDevolver: TSpeedButton;
    DateTimePicker: TDateTimePicker;
    ComboBoxLivros: TComboBox;
    pnlFooter: TPanel;
    pnlHeader: TPanel;
    btnClose: TSpeedButton;
    pnlTitle: TPanel;
    lblTitle: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure btnDevolverClick(Sender: TObject);
    procedure pnlHeaderMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    procedure CarregarLivrosEmprestados;
  public
    { Public declarations }
  end;

var
  ViewDevolucoes: TViewDevolucoes;

implementation

{$R *.dfm}

procedure TViewDevolucoes.btnCloseClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TViewDevolucoes.btnDevolverClick(Sender: TObject);
  var
  EmprestimoID: Integer;
begin
  if ComboBoxLivros.ItemIndex <> -1 then
  begin
    EmprestimoID := Integer(ComboBoxLivros.Items.Objects[ComboBoxLivros.ItemIndex]);

    ServiceConexao.FDQuery_CadastrarLivros.SQL.Text := 'UPDATE livros SET liv_status = :liv_status WHERE liv_codigo = ' +
                        '(SELECT emp_livro FROM emprestimos WHERE emp_codigo = :emp_codigo)';
    ServiceConexao.FDQuery_CadastrarLivros.ParamByName('liv_status').AsString := 'disponível';
    ServiceConexao.FDQuery_Emprestimos.ParamByName('emp_codigo').AsInteger := EmprestimoID;
    ServiceConexao.FDQuery_CadastrarLivros.ExecSQL;

    ServiceConexao.FDQuery_Emprestimos.SQL.Text := 'UPDATE emprestimos SET emp_status = :emp_status, emp_data_devolucao = :emp_data_devolucao ' +
                        'WHERE emp_codigo = :emp_codigo';
    ServiceConexao.FDQuery_Emprestimos.ParamByName('emp_status').AsString := 'devolvido';
    ServiceConexao.FDQuery_Emprestimos.ParamByName('emp_data_devolucao').AsDate := Now;
    ServiceConexao.FDQuery_Emprestimos.ParamByName('emp_codigo').AsInteger := EmprestimoID;
    ServiceConexao.FDQuery_Emprestimos.ExecSQL;

    ShowMessage('Livro devolvido com sucesso!');
    CarregarLivrosEmprestados;
  end
  else
  begin
    ShowMessage('Selecione um livro para devolução!');
  end;
end;

procedure TViewDevolucoes.CarregarLivrosEmprestados;
begin // carregar livros emprestados
  ServiceConexao.FDQuery_Emprestimos.SQL.Text := 'SELECT e.emp_codigo, l.liv_titulo ' +
                      'FROM emprestimos e ' +
                      'JOIN livros l ON e.emp_livro = l.liv_codigo ' +
                      'WHERE e.emp_status = :emp_status';
  ServiceConexao.FDQuery_Emprestimos.ParamByName('emp_status').AsString := 'emprestado';
  ServiceConexao.FDQuery_Emprestimos.Open;

  ComboBoxLivros.Items.Clear;

  while not ServiceConexao.FDQuery_CadastrarLivros.Eof do
  begin
    ComboBoxLivros.Items.AddObject(ServiceConexao.FDQuery_CadastrarLivros.FieldByName('liv_titulo').AsString, TObject(ServiceConexao.FDQuery_Emprestimos.FieldByName('emp_codigo').AsInteger));
    ServiceConexao.FDQuery_CadastrarLivros.Next;
  end;

  ServiceConexao.FDQuery_CadastrarLivros.Close;
end;

procedure TViewDevolucoes.pnlHeaderMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
   sc_DragMove = $f012;
begin
  ReleaseCapture;
  Perform(wm_SysCommand, sc_DragMove, 0);
end;

end.
