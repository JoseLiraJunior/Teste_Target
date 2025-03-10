unit uTeste;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmTesteTarget = class(TForm)
    gbFibonacci: TGroupBox;
    edtFibonacci: TEdit;
    btnFibonacci: TButton;
    gbStringInversa: TGroupBox;
    lbStringInvertida: TLabel;
    edtString: TEdit;
    btnInverterString: TButton;
    gbCalculaPercentual: TGroupBox;
    cbPercentualEstados: TComboBox;
    Label1: TLabel;
    btnCalcularTotal: TButton;
    btnCalcularPercentual: TButton;
    lbTotalFaturamento: TLabel;
    gbLerArquivo: TGroupBox;
    Label2: TLabel;
    btnExibirMaior: TButton;
    edtArquivo: TEdit;
    OpJson: TOpenDialog;
    btnCarregarJson: TButton;
    btnExibirMenor: TButton;
    gbAlgoritmo: TGroupBox;
    Button1: TButton;
    procedure edtFibonacciKeyPress(Sender: TObject; var Key: Char);
    procedure btnInverterStringClick(Sender: TObject);
    procedure btnFibonacciClick(Sender: TObject);
    procedure btnCalcularTotalClick(Sender: TObject);
    procedure btnCalcularPercentualClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCarregarJsonClick(Sender: TObject);
    procedure btnExibirMaiorClick(Sender: TObject);
    procedure btnExibirMenorClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FTotal, FPercentual, FMenorValor, FMaiorValor : Double;
  public
    { Public declarations }
  end;

var
  frmTesteTarget: TfrmTesteTarget;

implementation

uses
  System.Json;

{$R *.dfm}

procedure TfrmTesteTarget.btnCalcularTotalClick(Sender: TObject);
var
  i, j : integer;
  Total : Double;
  strAuxiliar, strTotal : string;
begin
  FTotal := 0;
  for i := 0 to cbPercentualEstados.Items.Count - 1 do
  begin
    strTotal := EmptyStr;
    strAuxiliar := cbPercentualEstados.Items[i];
    for j := 0 to  Length(strAuxiliar) do
    begin
      if strAuxiliar[j] in ['0'..'9',','] then
        strTotal := strTotal + strAuxiliar[j];
    end;
    FTotal := FTotal + StrToFloat(strTotal);
  end;

  lbTotalFaturamento.Caption := 'Total do Faturamento.: R$ ' + FloatToStr(FTotal);
end;

procedure TfrmTesteTarget.btnFibonacciClick(Sender: TObject);
var
  numAnterior, numAuxiliar, Fibonacci, numInformado : integer;
begin
  //Recebendo dados do usu�rio
  numInformado := StrToInt(edtFibonacci.Text);

  //Caso o usu�rio informe os primeiros n�meros da sequ�ncia
  if numInformado in [0, 1, 2] then
  begin
    ShowMessage('O n�mero informado pertence a sequ�ncia de Fibonacci!');
    Exit;
  end;

  //Iniciliaza as vari�veis
  numAnterior := 1;
  Fibonacci := 2;
  numAuxiliar := 0;

  while Fibonacci <= numInformado do
  begin
    if numInformado = Fibonacci then
      Break;
    numAuxiliar := Fibonacci;
    Fibonacci := Fibonacci + numAnterior;
    numAnterior := numAuxiliar;
  end;

  if numInformado = Fibonacci then
    ShowMessage('O n�mero informado pertence a sequ�ncia de Fibonacci!')
  else
    ShowMessage('O n�mero informado n�o pertence a sequ�ncia de Fibonacci!');
end;

procedure TfrmTesteTarget.btnInverterStringClick(Sender: TObject);
var
  i : Integer;
  strInversa : string;
begin
  //Remove visualiza��o do resultado anterior para o usu�rio.
  lbStringInvertida.Visible := False;
  //Limpa a vari�vel
  strInversa := EmptyStr;

  //Percorre a string fornecida pelo usu�rio do in�cio para o come�o
  // e grava o valor na vari�vel.
  for I := Length(edtString.Text) downto 1 do
    strInversa := strInversa + edtString.Text[i];

  //Exibe o valor para o usu�rio...
  lbStringInvertida.Visible := True;
  lbStringInvertida.Caption := strInversa;
end;

procedure TfrmTesteTarget.Button1Click(Sender: TObject);
var
  Soma, K, Z : Integer;
begin
  Z := 13;
  K := 0;
  Soma := 0;

  while K < Z do
  begin
    K := K + 1;
    Soma := Soma + K;
    ShowMessage('Valor de K: '+ IntToStr(K) + ' - Valor da Soma: ' + IntToStr(Soma));
  end;

  ShowMessage('Valor da Soma: ' + IntToStr(Soma));
end;

procedure TfrmTesteTarget.btnExibirMaiorClick(Sender: TObject);
begin
  ShowMessage('O maior Valor de Venda no dia foi de: ' + FloatToStr(FMaiorValor));
end;

procedure TfrmTesteTarget.btnExibirMenorClick(Sender: TObject);
begin
  ShowMessage('O menor Valor de Venda no dia foi de: ' + FloatToStr(FMenorValor));
end;

procedure TfrmTesteTarget.btnCarregarJsonClick(Sender: TObject);
var
  strlistJson : TStringList;
  JsonObject, JsonDia : TJSONObject;
  JArray : TJSONArray;
  i : Integer;
  SomaValores, MaiorValor, MenorValor : Double;
  TotalDias : Integer;
begin
  strlistJson := TStringList.Create;
  JsonObject := TJSONObject.Create;

  if OpJson.Execute then
  begin
    try
      edtArquivo.Text := OpJson.FileName;
      strlistJson.LoadFromFile(edtArquivo.Text);
      // Joga arquivo carregado na StringList na vari�vel Json;
      JSonObject := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(strlistJson.Text), 0) as TJSONObject;

      JArray := JsonObject.GetValue<TJSONArray>('');

      TotalDias := 0;
      SomaValores := 0;
      MaiorValor := 0;
      MenorValor := 0;

      for i := 0 to JArray.Count - 1 do
      begin
        JsonDia := JArray.Items[i] as TJSONObject;
        Inc(TotalDias);

        if MenorValor = 0 then
          MenorValor := StrToFloat(JsonDia.GetValue<string>('valor'));
        if MaiorValor = 0 then
          MaiorValor := StrToFloat(JsonDia.GetValue<string>('valor'));

        if MenorValor > StrToFloat(JsonDia.GetValue<string>('valor')) then
          MenorValor := StrToFloat(JsonDia.GetValue<string>('valor'));
        if MaiorValor < StrToFloat(JsonDia.GetValue<string>('valor')) then
          MaiorValor := StrToFloat(JsonDia.GetValue<string>('valor'));

        SomaValores := SomaValores + StrToFloat(JsonDia.GetValue<string>('valor'));
      end;

      FMenorValor := MenorValor;
      FMaiorValor := MaiorValor;
    finally
      FreeAndNil(JsonObject);
      FreeAndNil(strlistJson);
    end;
  end;
end;

procedure TfrmTesteTarget.btnCalcularPercentualClick(Sender: TObject);
var
  i : integer;
  strPercentual : string;
  percentagem : Double;
begin
  FPercentual := 0;
  strPercentual := EmptyStr;

  if cbPercentualEstados.ItemIndex < 0 then
  begin
    ShowMessage('Selecione um Estado antes de calcular o percentual');
    Exit;
  end;

  if FTotal = 0 then
  begin
    ShowMessage('Calcule o Total de Faturamento antes de Continuar!');
    Exit;
  end;

  for i := 0 to  Length(cbPercentualEstados.Text) do
  begin
    if cbPercentualEstados.Text[i] in ['0'..'9',','] then
      strPercentual := strPercentual + cbPercentualEstados.Text[i];
  end;

  FPercentual := (StrToFloat(strPercentual) * 100) / FTotal;

  lbTotalFaturamento.Caption := 'Total do Faturamento.: R$ ' + FloatToStr(FTotal) + sLineBreak +
                     'O Estado Selecionado Faturou.:' + strPercentual + sLineBreak +
                     'O que representa .:' + FormatFloat(',0.00', FPercentual) + '% do Total';
end;

procedure TfrmTesteTarget.edtFibonacciKeyPress(Sender: TObject; var Key: Char);
begin
  //protege digita��o para aceitar apenas N�meros positivos
  if not(Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TfrmTesteTarget.FormShow(Sender: TObject);
begin
  //Inicializa vari�veis.
  FTotal := 0;
  FPercentual := 0;
  FMenorValor := 0;
  FMaiorValor := 0;
end;

end.
