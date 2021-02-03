module LanguageService
  def validate_language(language)
    return 'INVALID' if language.nil?

    language = language.upcase
    
    if fs_languages.include?(language) == false
      return  "#{language}-INVALID"
    end

    language
  end

  def fs_languages
    %w[
      AR
      DA
      DE
      EN
      ES
      FR
      HR
      IT
      JA
      KR
      NL
      NO
      PT
      RU
      SV
      ZH
    ]
  end
end