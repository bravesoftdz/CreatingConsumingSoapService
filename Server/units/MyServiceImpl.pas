{ Fichier d'impl�mentation invocable pour TMyService impl�mentant IMyService }

unit MyServiceImpl;

interface

uses InvokeRegistry, Types, XSBuiltIns, MyServiceIntf;

type

  { TMyService }
  TMyService = class(TInvokableClass, IMyService)
  public
    function echoEnum(const Value: TEnumTest): TEnumTest; stdcall;
    function echoDoubleArray(const Value: TDoubleArray): TDoubleArray; stdcall;
    function echoMyEmployee(const Value: TMyEmployee): TMyEmployee; stdcall;
    function echoDouble(const Value: Double): Double; stdcall;
  end;

implementation

function TMyService.echoEnum(const Value: TEnumTest): TEnumTest; stdcall;
begin
  { TODO : Impl�menter la m�thode echoEnum }
  Result := Value;
end;

function TMyService.echoDoubleArray(const Value: TDoubleArray): TDoubleArray; stdcall;
begin
  { TODO : Impl�menter la m�thode echoDoubleArray }
  Result := Value;
end;

function TMyService.echoMyEmployee(const Value: TMyEmployee): TMyEmployee; stdcall;
begin
  { TODO : Impl�menter la m�thode echoMyEmployee }
  Result := TMyEmployee.Create;
  Result.FirstName := Value.FirstName;
  Result.LastName := Value.LastName;
  Result.Salary := Value.Salary;
end;

function TMyService.echoDouble(const Value: Double): Double; stdcall;
begin
  { TODO : Impl�menter la m�thode echoDouble }
  Result := Value;
end;


initialization
{ les classes invocables doivent �tre recens�es  }
   InvRegistry.RegisterInvokableClass(TMyService);
end.

