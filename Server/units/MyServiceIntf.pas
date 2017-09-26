{ Interface invocable IMyService }

unit MyServiceIntf;

interface

uses InvokeRegistry, Types, XSBuiltIns;

type

  TEnumTest = (etNone, etAFew, etSome, etAlot);

  TDoubleArray = array of Double;

  TMyEmployee = class(TRemotable)
  private
    FLastName: AnsiString;
    FFirstName: AnsiString;
    FSalary: Double;
  published
    property LastName: AnsiString read FLastName write FLastName;
    property FirstName: AnsiString read FFirstName write FFirstName;
    property Salary: Double read FSalary write FSalary;
  end;

  { Les interfaces invocables doivent d�river de IInvokable }
  IMyService = interface(IInvokable)
  ['{853408E2-BD36-40A8-9733-DFE74C758452}']

    { Les m�thodes de l'interface invocable ne doivent pas utiliser la }
    { convention d'appel par d�faut ; stdcall est conseill� }
    function echoEnum(const Value: TEnumTest): TEnumTest; stdcall;
    function echoDoubleArray(const Value: TDoubleArray): TDoubleArray; stdcall;
    function echoMyEmployee(const Value: TMyEmployee): TMyEmployee; stdcall;
    function echoDouble(const Value: Double): Double; stdcall;
  end;

implementation

initialization
  { Les interfaces invocables doivent �tre recens�es }
  InvRegistry.RegisterInterface(TypeInfo(IMyService));

end.
