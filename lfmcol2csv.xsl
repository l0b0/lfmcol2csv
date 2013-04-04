<stylesheet
    version="1.0"
    xmlns="http://www.w3.org/1999/XSL/Transform"
    xmlns:strings="http://exslt.org/strings"
    >
    <output method="text" encoding="utf-8" />

    <param name="line-separator" select="'&#xa;'" /> <!-- Newline -->
    <param name="field-separator" select="','" /> <!-- Comma -->
    <param name="quote" select="'&quot;'" /> <!-- Double quote -->
    <param name="escaped-quote" select="'&quot;&quot;'" />

    <template match="/">
        <!-- In case you want headers
        <text>artist</text>
        <value-of select="$field-separator"/>
        <text>title</text>
        <value-of select="$line-separator" />
        -->
        <!--
        Only tracks with a name and artist can be imported by ivyishere.org/
        -->
        <apply-templates
            select="tracks/track[count(artist/name) = 1 and count(name) = 1]" />
    </template>

    <template match="track">
        <apply-templates select="artist/name"/>
        <value-of select="$field-separator"/>
        <apply-templates select="name"/>
        <value-of select="$line-separator" />
    </template>

    <template match="*">
        <!-- Replace all special characters -->
        <value-of select="concat(
            $quote,
            normalize-space(
                strings:replace(
                    strings:replace(
                        strings:replace(
                            .,
                            $quote,
                            $escaped-quote),
                        $line-separator,
                        ' '),
                    $field-separator,
                    ' ')),
            $quote)" />
    </template>
</stylesheet>
