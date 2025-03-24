unit service.conexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxDBSet;

type
  TServiceConexao = class(TDataModule)
    FDConnection: TFDConnection;
    FDQuery_CadastrarLivros: TFDQuery;
    FDQuery_CadastrarLivrosLIV_CODIGO: TIntegerField;
    FDQuery_CadastrarLivrosLIV_TITULO: TStringField;
    FDQuery_CadastrarLivrosLIV_AUTOR: TStringField;
    FDQuery_CadastrarLivrosLIV_ANO_PUBLICACAO: TIntegerField;
    FDQuery_CadastrarLivrosLIV_STATUS: TStringField;
    FDQuery_CadastrarClientes: TFDQuery;
    FDQuery_CadastrarClientesPES_CODIGO: TIntegerField;
    FDQuery_CadastrarClientesPES_NOMECOMPLETO: TStringField;
    FDQuery_CadastrarClientesPES_TELEFONE: TStringField;
    FDQuery_CadastrarClientesPES_EMAIL: TStringField;
    FDQuery_Emprestimos: TFDQuery;
    FDQuery_EmprestimosEMP_CODIGO: TIntegerField;
    FDQuery_EmprestimosEMP_CLIENTE: TIntegerField;
    FDQuery_EmprestimosEMP_LIVRO: TIntegerField;
    FDQuery_EmprestimosEMP_DATA_EMPRESTIMO: TDateField;
    FDQuery_Login: TFDQuery;
    FDQuery_LoginLOG_CODIGO: TIntegerField;
    FDQuery_LoginLOG_USUARIO: TStringField;
    FDQuery_LoginLOG_SENHA: TStringField;
    FDQuery_LoginLOG_CARGO: TStringField;
    frxReport: TfrxReport;
    frxDBDataset_Livros: TfrxDBDataset;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ServiceConexao: TServiceConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
