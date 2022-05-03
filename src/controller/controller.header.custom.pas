unit controller.header.custom;


interface

uses Horse, System.JSON;

procedure Cliente;
procedure GetCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure GetClienteV1(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure GetClienteV2(Req: THorseRequest; Res: THorseResponse; Next: TProc);


implementation


procedure GetCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  if req.Headers.Items['version'] = 'v1' then
  begin
    GetClienteV1(req,res,next);
    exit;
  end;

  if req.Headers.Items['version'] = 'v2' then
  begin
    GetClienteV2(req,res,next);
    exit;
  end;
end;

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
         '"versao":"v2"}';

  Res.Send<TJSONObject>(TJSONObject.ParseJSONValue(LJson) as TJSONObject);

end;

procedure Cliente;
begin

  THorse.Get('/cliente/listar/custom',GetCliente);

end;

end.

