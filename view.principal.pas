unit view.principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.Imaging.jpeg, System.ImageList, Vcl.ImgList,
  view.cadastro.livros, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, view.cadastro.clientes, Vcl.Imaging.pngimage,
  view.emprestimos, view.devolucoes, view.livros.disponiveis, service.conexao,
  frxClass, frxDBSet;

type
  TViewPrincipal = class(TForm)
    pnlHeader: TPanel;
    pnlFooter: TPanel;
    pnlLeft: TPanel;
    pnlEspaco: TPanel;
    pnlMenu: TPanel;
    pnlTituloExpandir: TPanel;
    lblTituloMenu: TLabel;
    btnToggle: TSpeedButton;
    pnlBtnCadastroLivros: TPanel;
    btnCadastroLivros: TSpeedButton;
    pnlBtnCadastroClientes: TPanel;
    btnCadastroClientes: TSpeedButton;
    pnlBtnRelatorios: TPanel;
    btnRelatorios: TSpeedButton;
    pnlBtnEmprestimos: TPanel;
    btnEmprestimos: TSpeedButton;
    pnlBtnIniciarVenda: TPanel;
    btnIniciarVenda: TSpeedButton;
    pnlEmpresa: TPanel;
    ImageList: TImageList;
    btnClose: TSpeedButton;
    pnlUsuario: TPanel;
    imgUser: TImage;
    lblUsuario: TLabel;
    lblCargo: TLabel;
    pnlBtnDevolucoes: TPanel;
    btnDevolucoes: TSpeedButton;
    lblTituloEmpresa: TLabel;
    lblNomeEmpresa: TLabel;
    pnlContent: TPanel;
    Image1: TImage;
    procedure btnToggleClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnCadastroLivrosClick(Sender: TObject);
    procedure btnCadastroClientesClick(Sender: TObject);
    procedure btnEmprestimosClick(Sender: TObject);
    procedure btnDevolucoesClick(Sender: TObject);
    procedure btnIniciarVendaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRelatoriosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

{$R *.dfm}

procedure TViewPrincipal.btnCadastroClientesClick(Sender: TObject);
begin // cadastro clientes
  ViewCadastroClientes := TViewCadastroClientes.Create(Self);
    try
      ViewCadastroClientes.Top  := 380;
      ViewCadastroClientes.Left := 755;

      ViewCadastroClientes.ShowModal;
    finally
      ViewCadastroClientes.Free;
    end;
end;

procedure TViewPrincipal.btnCadastroLivrosClick(Sender: TObject);
begin // cadastro livros
  ViewCadastroLivros := TViewCadastroLivros.Create(Self);
  try
//    se fosse maximizado
//    ViewCadastroLivros.Top  := Round(pnlHeader.Height + ((pnlHeader.Height - ViewCadastroLivros.Height) /2));
//    ViewCadastroLivros.Left := Round(pnlLeft.Width + ((pnlContent.Width - ViewCadastroLivros.Width) /2));

    ViewCadastroLivros.Top  := 380;
    ViewCadastroLivros.Left := 755;

    ViewCadastroLivros.ShowModal;
  finally
    ViewCadastroLivros.Free;
  end;
end;

procedure TViewPrincipal.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TViewPrincipal.btnDevolucoesClick(Sender: TObject);
begin // devoluções
  ViewDevolucoes := TViewDevolucoes.Create(Self);
  try
    ViewDevolucoes.Top  := 380;
    ViewDevolucoes.Left := 755;

    ViewDevolucoes.ShowModal;
  finally
    ViewDevolucoes.Free;
  end;
end;

procedure TViewPrincipal.btnEmprestimosClick(Sender: TObject);
begin // empréstimos
    ViewEmprestimos := TViewEmprestimos.Create(Self);
  try
    ViewEmprestimos.Top  := 380;
    ViewEmprestimos.Left := 755;

    ViewEmprestimos.ShowModal;
  finally
    ViewEmprestimos.Free;
  end;
end;

procedure TViewPrincipal.btnIniciarVendaClick(Sender: TObject);
begin // livros disponíveis
  ViewLivrosDisponiveis := TViewLivrosDisponiveis.Create(Self);
  try
    ViewLivrosDisponiveis.Top  := 250;
    ViewLivrosDisponiveis.Left := 695;

    ViewLivrosDisponiveis.ShowModal;
  finally
    ViewLivrosDisponiveis.Free;
  end;
end;

procedure TViewPrincipal.btnRelatoriosClick(Sender: TObject);
begin
  ServiceConexao.frxReport.ShowReport(); // mostra relatório
end;

procedure TViewPrincipal.btnToggleClick(Sender: TObject);
begin // menu
  if pnlMenu.Height = 40 then
    begin
      // expande o menu
      pnlMenu.Height := 400;
      // altera icone para retrair
      btnToggle.Tag := 1;
      btnToggle.ImageIndex := 1;
    end
    else
    begin
      // recolhe o menu
      pnlMenu.Height := 40;
      // altera icone para expandir
      btnToggle.Tag := 0;
      btnToggle.ImageIndex := 0;
    end;
end;

procedure TViewPrincipal.FormShow(Sender: TObject);
var // atribui nome de usuário ao label
  nomeUsuario: string;
  cargoUsuario: string;
begin
  if not ServiceConexao.FDQuery_Login.Eof then
  begin
    nomeUsuario := ServiceConexao.FDQuery_Login.FieldByName('log_usuario').AsString;
    lblUsuario.Caption := nomeUsuario;

    cargoUsuario := ServiceConexao.FDQuery_Login.FieldByName('log_cargo').AsString;
    lblCargo.Caption := cargoUsuario;
  end
  else
  begin
    lblUsuario.Caption := 'Usuário não encontrado!';
  end;
end;

end.
