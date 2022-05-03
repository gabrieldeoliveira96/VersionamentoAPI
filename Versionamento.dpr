program Versionamento;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  controller.path in 'src\controller\controller.path.pas',
  controller.query in 'src\controller\controller.query.pas',
  controller.header.accept in 'src\controller\controller.header.accept.pas',
  controller.header.custom in 'src\controller\controller.header.custom.pas';

begin
  THorse.Use(Jhonson());

  controller.path.cliente;
  controller.query.cliente;
  controller.header.accept.Cliente;
  controller.header.custom.Cliente;

  THorse.Get('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send('pong');
    end);

  THorse.Listen(9000);

end.
