<xsl:template name="tokens">
	<xsl:param name="str"/>
	<xsl:param name="splitString"
         		select="' '"/>
	<xsl:choose>
		<xsl:when test="contains($str,$splitString)">
			<token>
				<xsl:value-of select="substring-before($str,$splitString)"/>
			</token>
			<xsl:call-template name="tokens">
				<xsl:with-param name="str"
              					select="substring-after($str,$splitString)"/>
				<xsl:with-param name="splitString"
              					select="$splitString"/>
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<token>
				<xsl:value-of select="$str"/>
			</token>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>