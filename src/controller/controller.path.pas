unit controller.path;

interface

uses Horse, System.JSON;

procedure Cliente;
procedure GetClienteV1(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure GetClienteV2(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation


procedure GetClienteV1(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
 LJson:string;
begin

  LJson:='{"nome":"teste", '+
          '"versao":"v1"}';

  Res.Send<TJSONObject>(TJSONObject.ParseJSONValue(LJson) as TJSONObject);


end;

procedure GetClienteV2(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
 LJson:string;
begin

  LJson:='{"nome":"teste", '+
         ' "cpf" :"123", '+
         '"versao":"v1"}';

  Res.Send<TJSONObject>(TJSONObject.ParseJSONValue(LJson) as TJSONObject);

end;

procedure Cliente;
begin

  THorse.Get('/cliente/v1/listar',GetClienteV1);
  THorse.Get('/cliente/v2/listar',GetClienteV2);

end;


end.
