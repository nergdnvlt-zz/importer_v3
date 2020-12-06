module RolandProductPath
  def validate_product_paths
    @subs.each do |sub|
      sub[:product_path] = normalize(sub[:product_path].split(":")[0])
    end
  end

  def normalize(path)
    # FS-01
    return ultimate_annual if ultimate_annual?(path)
    # FS-02
    return ultimate_monthly if ultimate_monthly?(path)
    # FS-03
    return pro_annual if pro_annual?(path)
    # FS-04
    return pro_monthly if pro_monthly?(path)
    # FS-05
    return core_annual if core_annual?(path)
    # FS-06
    return core_monthly if core_monthly?(path)
    # FS-07
    return ultimate_3_monthly if ultimate_3_monthly?(path)
    # FS-08
    return ultimate_2_year if ultimate_2_year?(path)
    # FS-09
    return ultimate_5_year if ultimate_5_year?(path)
    # FS-10
    return drumbundle_monthly if drumbundle_monthly?(path)
    # FS-11
    return drumbundle_special_monthly if drumbundle_special_monthly?(path)
    # FS-12
    return drumbundle_annual if drumbundle_annual?(path)
    # FS-13
    return tr808_monthly if tr808_monthly?(path)
    # FS-14
    return tr808_annual if tr808_annual?(path)
    # FS-15
    return tr909_monthly if tr909_monthly?(path)
    # FS-16
    return tr909_annual if tr909_annual?(path)
  end

  def core_annual_id
    %w[
      I6dih9bK
    ]
  end

  def core_monthly_id
    %w[
      ZVQ7YzAv
    ]
  end

  def ultimate_annual_ids
    %w[
      3DgwqMuZ
      5SY3YY4T
      6m5G2isl
      739kN6ER
      EcJPEAky
      fIaj5Ag9
      fYOQ3udE
      hBHag80i
      kAtAtKxq
      nZ1h8O80
      plZyGs07
      QWJ3Drgt
      RuGEKBxa
      tHxmwP8K
      u9vwcveI
      V1iNiibY
      vr9CwZIe
      yOcyGKrm
    ]
  end

  def ultimate_monthly_ids
    %w[
      oReylLim
      rRyPWZRP
      4iK5rY4F
      h6CQJlaS
      VTdQrfvS
      qE8hnWZB
      jbahYsAL
      iYOKs6qR
      MnZ2vhsE
      fg5HYnFL
      Jgqk30HO
      s0zPmv6u
      Jw4wzbwc
      KVHOmnco
      sJunLkN7
      PL8wfFuK
      MXQxQCZy
      YQm65W99
      HXgwpYUj
    ]
  end

  def pro_annual_id
    %w[
      IIat93Zh
    ]
  end

  def pro_monthly_id
    %w[
      nHkk4Oal
    ]
  end

  def ultimate_3_monthly_ids
    %w[
      JxeTwqXe
      cKATIjYn
      s7NzxvjV
      MMUGwW5K
      FviqVDWs
      hHIwW9nr
      hhJYtApr
      lf3oDlVt
      KECuYuVW
      qSOrlsqk
      pWKDOOdx
      QNhttjva
    ]
  end

  def ultimate_2_year_ids
    %w[
      SyJ7BZ2z
      tJw17LEL
      hBKnoa9B
      Wrl6DFme
      vasEh7QB
      U09lWFM0
      3gHIuDkY
      R4moVH1J
      9OvTGDSI
      mgFW0LCu
      u3Th48DX
      ZTT9laGt
    ]
  end

  def ultimate_5_year_ids
    %w[
      NEHu5x4i
      kBDVHacp
      z9pxS1ZT
      9hLcGgQs
      EwrECMQe
      pHKooMMY
      zdqoGTtB
      wbJfUAmg
      olTLs5fw
      Xlbpx5L6
      UJBo4OY6
      WMKsn9H7
    ]
  end

  def drumbundle_monthly_ids
    %w[
      qk2dFEW1
      48ivo1ai
      ffGjVOBP
      8KC1HcDW
      qg6aW3a2
      XIEQekhn
    ]
  end

  def drumbundle_special_monthly_ids
    %w[
      EdrSzDFU
      N0rA8QCp
      iarXMVjM
      gJ4vCi6I
      ujNCp48q
      ENJZ3ByM
    ]
  end

  def drumbundle_annual_ids
    %w[
      skdejFh7
      j3eMPzTG
      jtGPpIFx
      h6jQUCqP
      X4DvGvXV
      G8ioEYfj
    ]
  end

  def tr808_monthly_ids
    %w[
      W7tUHgZ0
      V4TuJgQh
      YFiaZXpK
      4XJi5lKh
      Xrt0DttN
      xTXcwWPD
    ]
  end

  def tr808_annual_ids
    %w[
      pxYtzY44
      FVVJdH8R
      t0ivv30O
      jfumXHC0
      OeB1A1bU
    ]
  end

  def tr909_monthly_ids
    %w[
      TwaYJnIj
      WoLwdWyf
      PtflNwqa
      12H0GMf0
      J4zdaFg2
      uumhaZO4
    ]
  end

  def tr909_annual_ids
    %w[
      7SWL5jLa
      m1Iv2hV8
      k9iLjhdv
      5x43p0zC
      xpwWrM3y
      MQCgiqi2
    ]
  end

  # ULTIMATE ANNUAL
  def ultimate_annual?(path)
    ultimate_annual_ids.include?(path)
  end

  def ultimate_annual
    'FS-01'
  end


  # ULTIMATE ANNUAL
  def ultimate_monthly?(path)
    ultimate_monthly_ids.include?(path)
  end

  def ultimate_monthly
    'FS-02'
  end


  # PRO ANNUAL
  def pro_annual?(path)
    pro_annual_id.include?(path)
  end

  def pro_annual
    'FS-03'
  end

  # PRO Monthly
  def pro_monthly?(path)
    pro_monthly_id.include?(path)
  end

  def pro_monthly
    'FS-04'
  end


  # CORE ANNUAL
  def core_annual?(path)
    core_annual_id.include?(path)
  end

  def core_annual
    'FS-05'
  end


  # CORE MONTHLY
  def core_monthly?(path)
    core_monthly_id.include?(path)
  end

  def core_monthly
    'FS-06'
  end


  # ULTIMATE 3 MONTHS
  def ultimate_3_monthly?(path)
    ultimate_3_monthly_ids.include?(path)
  end

  def ultimate_3_monthly
    'FS-07'
  end


  # ULTIMATE 2 YEAR
  def ultimate_2_year?(path)
    ultimate_2_year_ids.include?(path)
  end

  def ultimate_2_year
    'FS-08'
  end


  # ULTIMATE 5 YEAR
  def ultimate_5_year?(path)
    ultimate_5_year_ids.include?(path)
  end

  def ultimate_5_year
    'FS-09'
  end


  # DRUMBUNDLE MONTHLY
  def drumbundle_monthly?(path)
    drumbundle_monthly_ids.include?(path)
  end

  def drumbundle_monthly
    'FS-10'
  end


  # DRUMBUNDLE SPECIAL MONTHLY
  def drumbundle_special_monthly?(path)
    drumbundle_special_monthly_ids.include?(path)
  end

  def drumbundle_special_monthly
    'FS-11'
  end


  # DRUMBUNDLE ANNUAL
  def drumbundle_annual?(path)
    drumbundle_annual_ids.include?(path)
  end

  def drumbundle_annual
    'FS-12'
  end

  
  # TR-808 MONTHLY
  def tr808_monthly?(path)
    tr808_monthly_ids.include?(path)
  end

  def tr808_monthly
    'FS-13'
  end


  # TR-808 ANNUAL
  def tr808_annual?(path)
    tr808_annual_ids.include?(path)
  end

  def tr808_annual
    'FS-14'
  end


  # TR-909 MONTHLY
  def tr909_monthly?(path)
    tr909_monthly_ids.include?(path)
  end

  def tr909_monthly
    'FS-15'
  end


  # TR-909 ANNUAL
  def tr909_annual?(path)
    tr909_annual_ids.include?(path)
  end

  def tr909_annual
    'FS-16'
  end
end
