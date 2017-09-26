// ************************************************************************ //
// Les types d�clar�s dans ce fichier ont �t� g�n�r�s � partir de donn�es lues
// depuis le fichier WSDL d�crit ci-dessous :
// WSDL     : http://localhost:8080/wsdl/IMyService
//  >Importer : http://localhost:8080/wsdl/IMyService>0
// Version  : 1.0
// (26-09-17 09:34:17 - - $Rev: 25127 $)
// ************************************************************************ //

unit unitIMyService;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // Les types suivants mentionn�s dans le document WSDL ne sont pas repr�sent�s
  // dans ce fichier. Ce sont des alias[@] d'autres types repr�sent�s ou alors ils �taient r�f�renc�s
  // mais jamais[!] d�clar�s dans le document. Les types de la derni�re cat�gorie
  // sont en principe mapp�s sur des types Embarcadero ou XML pr�d�finis/connus. Toutefois, ils peuvent aussi 
  // signaler des documents WSDL incorrects n'ayant pas r�ussi � d�clarer ou importer un type de sch�ma.
  // ************************************************************************ //
  // !:double          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]

  TMyEmployee          = class;                 { "urn:MyServiceIntf"[GblCplx] }

  {$SCOPEDENUMS ON}
  { "urn:MyServiceIntf"[GblSmpl] }
  TEnumTest = (etNone, etAFew, etSome, etAlot);

  {$SCOPEDENUMS OFF}

  TDoubleArray = array of Double;               { "urn:MyServiceIntf"[GblCplx] }


  // ************************************************************************ //
  // XML       : TMyEmployee, global, <complexType>
  // Espace de nommage : urn:MyServiceIntf
  // ************************************************************************ //
  TMyEmployee = class(TRemotable)
  private
    FLastName: string;
    FFirstName: string;
    FSalary: Double;
  published
    property LastName:  string  read FLastName write FLastName;
    property FirstName: string  read FFirstName write FFirstName;
    property Salary:    Double  read FSalary write FSalary;
  end;


  // ************************************************************************ //
  // Espace de nommage : urn:MyServiceIntf-IMyService
  // soapAction : urn:MyServiceIntf-IMyService#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // Liaison : IMyServicebinding
  // service   : IMyServiceservice
  // port      : IMyServicePort
  // URL       : http://localhost:8080/soap/IMyService
  // ************************************************************************ //
  IMyService = interface(IInvokable)
  ['{DB19E7F5-81BE-5555-5B5D-9B1CCADC7F5F}']
    function  echoEnum(const Value: TEnumTest): TEnumTest; stdcall;
    function  echoDoubleArray(const Value: TDoubleArray): TDoubleArray; stdcall;
    function  echoMyEmployee(const Value: TMyEmployee): TMyEmployee; stdcall;
    function  echoDouble(const Value: Double): Double; stdcall;
  end;

function GetIMyService(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IMyService;


implementation
  uses SysUtils;

function GetIMyService(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IMyService;
const
  defWSDL = 'http://localhost:8080/wsdl/IMyService';
  defURL  = 'http://localhost:8080/soap/IMyService';
  defSvc  = 'IMyServiceservice';
  defPrt  = 'IMyServicePort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as IMyService);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(IMyService), 'urn:MyServiceIntf-IMyService', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IMyService), 'urn:MyServiceIntf-IMyService#%operationName%');
  RemClassRegistry.RegisterXSInfo(TypeInfo(TDoubleArray), 'urn:MyServiceIntf', 'TDoubleArray');
  RemClassRegistry.RegisterXSClass(TMyEmployee, 'urn:MyServiceIntf', 'TMyEmployee');
  RemClassRegistry.RegisterXSInfo(TypeInfo(TEnumTest), 'urn:MyServiceIntf', 'TEnumTest');

end.