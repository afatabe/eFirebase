unit eFirebase;

//--------------------------------------------------------------------------------
//  eFirebase - vers�o 1.1.1
//  --------------------------
//  Biblioteca para consumo de recursos do Firebase
//  Desenvolvida por Rafael de Figueiredo Alves (DevPegasus)
//  -------------------------------------------------------
//  Dedicat�ria: "Dedico esta biblioteca aos grandes amores da minha vida, minha esposa Jailza e meus filhos Rafaela e Davi."
//--------------------------------------------------------------------------------

interface

Uses
  eFirebase.Interfaces;

Type
 TeFirebase = Class(TInterfacedObject, ieFirebase)
    Private
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: ieFirebase;
     function Auth(const API_Key: string): ieFirebaseAuth;
     function RealTimeDB(const ProjectCode: string): ieFirebaseRealtime;
     function Storage(const ProjectCode: string): ieFirebaseStorage;
     class function Version: string;
  End;

 const
  eFirebase_VERSION = '1.1.1';

implementation

uses
  eFirebase.Auth,
  eFirebase.Storage,
  eFirebase.RealTimeDB;

{ TeFirebase }

/// <summary>
///   M�todo Construtor. Use o m�todo New preferencialmente
/// </summary>
constructor TeFirebase.Create;
begin

end;

/// <summary>
///   M�todo destruidor. N�o utilize-o
/// </summary>
destructor TeFirebase.Destroy;
begin

  inherited;
end;

/// <summary>
///   M�todo inicializador da lib
/// </summary>
/// <returns>
///   Retorna a interface de m�todos da lib
/// </returns>
class function TeFirebase.New: ieFirebase;
begin
  Result := Self.Create;
end;

/// <summary>
///  M�todo para acessar as fun��es do Firebase Auth
/// </summary>
/// <param name="API_Key">
/// Chave da API obtida nas op��es de seu projeto no Firebase
/// </param>
/// <returns>
///   Retorna interface das fun��es associadas a autentica��o Firebase
/// </returns>
function TeFirebase.Auth(const API_Key: string): ieFirebaseAuth;
begin
  Result := TeFirebaseAuth.New(API_Key);
end;

/// <summary>
///  M�todo para acessar as fun��es do Firebase RealTime Database
/// </summary>
/// <param name="ProjectCode">
/// o C�digo ID do seu projeto no Firebase
/// </param>
/// <returns>
///  Retorna interface das fun��es associadas ao RealTime DataBase
/// </returns>
function TeFirebase.RealTimeDB(const ProjectCode: string): ieFirebaseRealtime;
begin
  Result := TeFirebaseRealTimeDB.New(ProjectCode);
end;

/// <summary>
///  M�todo para acessar as fun��es do Firebase Storage
/// </summary>
/// <param name="ProjectCode">
/// o C�digo ID do seu projeto no Firebase
/// </param>
/// <returns>
///  Retorna interface das fun��es associadas ao Firebase Storage
/// </returns>
function TeFirebase.Storage(const ProjectCode: string): ieFirebaseStorage;
begin
  Result := TeFirebaseStorage.New(ProjectCode);
end;

/// <summary>
///  M�todo para obter a vers�o da Biblioteca
/// </summary>
/// <returns>
///  Retorna uma string com informa��es da vers�o da biblioteca
/// </returns>
class function TeFirebase.Version: string;
begin
  Result := eFirebase_VERSION;
end;

end.
