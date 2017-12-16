Pod::Spec.new do |s|
  s.name             = 'iSnackBar'
  s.version          = '0.1.1'
  s.summary          = 'An iOS implementation of the Material Design Snackbar component.'
 
  s.description      = <<-DESC
Snackbars are a Android UI component which present a stylish, actionable alert to the user. Google also uses their own iOS snackbar implementation in some of their iOS apps, such as Gmail.
Snackbar's are useful for presenting a brief message to the user which they can then act on. A common usage pattern is to display a snackbar after a user has performed some destructive action, providing the user with a grace period during which they can undo this action.
                       DESC
 
  s.homepage         = 'https://github.com/iMhdi/iSnackBar'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'El Mahdi BOUKHRIS' => 'm.boukhris@gmail.com' }
  s.source           = { :git => 'https://github.com/iMhdi/iSnackBar.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '7.0'
  s.source_files = 'iSnackBar/*'
  s.frameworks = 'UIKit'
 
end