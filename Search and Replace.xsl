<xsl:template name="search-replace">
	<xsl:param name="text"/>
	<xsl:param name="search"/>
	<xsl:param name="replace"/>
	<xsl:choose>
		<xsl:when test="contains($text, $search)">
			<xsl:value-of select="substring-before($text, $search)"/>
			<xsl:value-of select="$replace"
            				disable-output-escaping="yes"/>
			<xsl:call-template name="search-replace">
				<xsl:with-param name="text"
              					select="substring-after($text, $search)"/>
				<xsl:with-param name="search"
              					select="$search"/>
				<xsl:with-param name="replace"
              					select="$replace"/>
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$text"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>