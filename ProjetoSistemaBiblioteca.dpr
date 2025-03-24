program ProjetoSistemaBiblioteca;

uses
  Vcl.Forms,
  view.principal in 'views\view.principal.pas' {ViewPrincipal},
  view.cadastro.livros in 'views\view.cadastro.livros.pas' {ViewCadastroLivros},
  service.conexao in 'services\service.conexao.pas' {ServiceConexao: TDataModule},
  view.cadastro.clientes in 'views\view.cadastro.clientes.pas' {ViewCadastroClientes},
  view.emprestimos in 'views\view.emprestimos.pas' {ViewEmprestimos},
  view.devolucoes in 'views\view.devolucoes.pas' {ViewDevolucoes},
  view.livros.disponiveis in 'views\view.livros.disponiveis.pas' {ViewLivrosDisponiveis},
  view.login in 'views\view.login.pas' {ViewLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewLogin, ViewLogin);
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.CreateForm(TViewCadastroLivros, ViewCadastroLivros);
  Application.CreateForm(TServiceConexao, ServiceConexao);
  Application.CreateForm(TViewCadastroClientes, ViewCadastroClientes);
  Application.CreateForm(TViewEmprestimos, ViewEmprestimos);
  Application.CreateForm(TViewDevolucoes, ViewDevolucoes);
  Application.CreateForm(TViewLivrosDisponiveis, ViewLivrosDisponiveis);
  Application.Run;
end.
