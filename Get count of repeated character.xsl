<xsl:value-of select="string-length($string)-string-length(translate($string,'$character',''))"/>
