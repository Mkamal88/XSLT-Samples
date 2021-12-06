<xsl:template name="ExtractField">
	<xsl:param name="input"/>
	<xsl:param name="fieldTag"/>
	<xsl:variable name="value">
		<xsl:value-of select="substring-before(substring-after($input,$fieldTag),'-}')"/>
	</xsl:variable>
	<xsl:choose>
		<xsl:when test="contains($value,':')">
			<xsl:call-template name="substring-before-last">
				<xsl:with-param name="list"
              					select="substring-before($value,':')"/>
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="substring-before-last">
				<xsl:with-param name="list"
              					select="$value"/>
			</xsl:call-template>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template name="substring-before-last">
	<xsl:param name="list"/>
	<xsl:param name="delimiter">
		<xsl:text>
		</xsl:text>
	</xsl:param>
	<xsl:choose>
		<xsl:when test="contains($list, $delimiter) and string-length(translate(translate($list, $delimiter,''),' ',''))!=0">
			<xsl:value-of select="substring-before($list,$delimiter)"/>
			<xsl:choose>
				<xsl:when test="contains(substring-after($list,$delimiter),$delimiter) 
                    and string-length(translate(translate(substring-after($list,$delimiter), $delimiter,''),' ',''))!=0">
					<xsl:value-of select="$delimiter"/>
				</xsl:when>
			</xsl:choose>
			<xsl:call-template name="substring-before-last">
				<xsl:with-param name="list"
              					select="substring-after($list,$delimiter)"/>
				<xsl:with-param name="delimiter"
              					select="$delimiter"/>
			</xsl:call-template>
		</xsl:when>
		<xsl:when test="string-length(translate(translate($list, $delimiter,''),' ',''))!=0">
			<xsl:copy-of select="$list"/>
		</xsl:when>
	</xsl:choose>
</xsl:template>