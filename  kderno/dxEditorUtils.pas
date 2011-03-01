unit dxEditorUtils;

interface

uses
  Types, Windows, SysUtils, Registry;

function CompileResource(const AFileName: string): Boolean;
function CorrectLocationPath(const APath: string): string;
function IsResourceCompilerExists: Boolean;

implementation

var
  ResourceCompiler: string;

function LocateResCompiler: string;

  function GetResourceCompilerPath(const AKey: string): string;
  begin
    Result := '';
    with TRegistry.Create(KEY_READ) do
    try
      RootKey := HKEY_LOCAL_MACHINE;
      if OpenKey(AKey, False) then
      begin
        Result := CorrectLocationPath(ReadString('RootDir'));
        CloseKey;
      end;
      if Result <> '' then
      begin
        Result := Result + 'Bin\brcc32.exe';
        if not FileExists(Result) then
          Result := '';
      end;
    finally
      Free;
    end;
  end;

const
  Compilers: array[0..8] of string = (
    'CodeGear\BDS\7.0', 'CodeGear\BDS\6.0', 'Borland\BDS\5.0',
    'Borland\BDS\4.0', 'Borland\BDS\3.0',  'Borland\BDS\2.0',
    'Borland\Delphi\7.0', 'Borland\Delphi\6.0', 'Borland\C++Builder\6.0');
var
  I: Integer;
begin
  for I := Low(Compilers) to High(Compilers) do
  begin
    Result := GetResourceCompilerPath('\Software\' + Compilers[I]);
    if Result <> '' then
      Break;
  end;
end;

function CompileResource(const AFileName: string): Boolean;
var
  SI: TStartupInfo;
  PI: TProcessInformation;
begin
  SI.cb := SizeOf(SI);
  SI.lpReserved := nil;
  SI.lpDesktop := nil;
  SI.lpTitle := nil;
  SI.dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
  SI.wShowWindow := SW_HIDE;
  SI.lpReserved2 := nil;
  SI.cbReserved2 := 0;
  SI.hStdInput := 0;
  SI.hStdOutput := 0;
  SI.hStdError := 0;
  CreateProcess(nil, PChar(ResourceCompiler + ' -fo "' +
    ChangeFileExt(AFileName, '.res') + '" "' + AFileName + '"'), nil, nil, True,
    CREATE_DEFAULT_ERROR_MODE, nil, nil, SI, PI);
  WaitForSingleObject(PI.hProcess, INFINITE);
  Result := FileExists(ChangeFileExt(AFileName, '.res'));
  CloseHandle(PI.hProcess);
  CloseHandle(PI.hThread);
end;

function CorrectLocationPath(const APath: string): string;
begin
  Result := APath;
  if (Length(Result) > 0) and (APath[Length(Result)] <> PathDelim) then
    Result := Result + PathDelim;
end;

function IsResourceCompilerExists: Boolean;
begin
  Result := FileExists(ResourceCompiler);
end;

initialization
  ResourceCompiler := LocateResCompiler;

finalization

end.
