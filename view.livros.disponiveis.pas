unit view.livros.disponiveis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.jpeg, service.conexao,
  view.cadastro.livros;

type
  TViewLivrosDisponiveis = class(TForm)
    pnlHeader: TPanel;
    btnClose: TSpeedButton;
    pnlFooter: TPanel;
    pnlTitle: TPanel;
    lblTitle: TLabel;
    pnlContent: TPanel;
    background: TImage;
    DBGrid: TDBGrid;
    DataSource: TDataSource;
    pnlBtnSalvar: TPanel;
    btnBtnFiltrar: TSpeedButton;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnBtnFiltrarClick(Sender: TObject);
    procedure pnlHeaderMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormResize(Sender: TObject);
  private
    procedure DimensionarGrid(dbg: TDBGrid);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewLivrosDisponiveis: TViewLivrosDisponiveis;

implementation

{$R *.dfm}

procedure TViewLivrosDisponiveis.btnBtnFiltrarClick(Sender: TObject);
begin // filtro
  ServiceConexao.FDQuery_CadastrarLivros.SQL.Text := 'SELECT * FROM livros WHERE liv_status = ''Disponível''';
  ServiceConexao.FDQuery_CadastrarLivros.Open;
end;

procedure TViewLivrosDisponiveis.btnCloseClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TViewLivrosDisponiveis.DimensionarGrid(dbg: TDBGrid);
type // dimensionar a grid automaticamente
  TArray = Array of Integer;
    procedure AjustarColumns(Swidth, TSize: Integer; Asize: TArray);
  var
  idx: Integer;
  begin
    if TSize = 0 then
    begin
      TSize := dbg.Columns.count;
      for idx := 0 to dbg.Columns.count - 1 do
      dbg.Columns[idx].Width := (dbg.Width - dbg.Canvas.TextWidth('AAAAAA')
      ) div TSize
    end
  else
    for idx := 0 to dbg.Columns.count - 1 do
    dbg.Columns[idx].Width := dbg.Columns[idx].Width +
    (Swidth * Asize[idx] div TSize);
  end;

  var
  idx, Twidth, TSize, Swidth: Integer;
  AWidth: TArray;
  Asize: TArray;
  NomeColuna: String;

  begin
    SetLength(AWidth, dbg.Columns.count);
    SetLength(Asize, dbg.Columns.count);
    Twidth := 0;
    TSize := 0;
    for idx := 0 to dbg.Columns.count - 1 do
      begin
      NomeColuna := dbg.Columns[idx].Title.Caption;
      dbg.Columns[idx].Width := dbg.Canvas.TextWidth
      (dbg.Columns[idx].Title.Caption + 'A');
      AWidth[idx] := dbg.Columns[idx].Width;
      Twidth := Twidth + AWidth[idx];

      if Assigned(dbg.Columns[idx].Field) then
      Asize[idx] := dbg.Columns[idx].Field.Size
      else
      Asize[idx] := 1;

      TSize := TSize + Asize[idx];
    end;

  if TDBGridOption.dgColLines in dbg.Options then
  Twidth := Twidth + dbg.Columns.count;

  // adiciona a largura da coluna indicada do cursor
  if TDBGridOption.dgIndicator in dbg.Options then
  Twidth := Twidth + IndicatorWidth;

  Swidth := dbg.ClientWidth - Twidth;
  AjustarColumns(Swidth, TSize, Asize);
  end;

procedure TViewLivrosDisponiveis.FormCreate(Sender: TObject);
begin
  ServiceConexao.FDQuery_CadastrarLivros.SQL.Text := 'SELECT * FROM livros';
  ServiceConexao.FDQuery_CadastrarLivros.Open;
end;

procedure TViewLivrosDisponiveis.FormResize(Sender: TObject);
begin
    DimensionarGrid(DBGrid);
end;

procedure TViewLivrosDisponiveis.pnlHeaderMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
   sc_DragMove = $f012;
begin
  ReleaseCapture;
  Perform(wm_SysCommand, sc_DragMove, 0);
end;

end.
