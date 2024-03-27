SELECT
    product,
    sub_product,
    COUNT(*) FILTER (WHERE EXTRACT(QUARTER FROM date_received::date) = 1) AS Q1,
    COUNT(*) FILTER (WHERE EXTRACT(QUARTER FROM date_received::date) = 2) AS Q2,
    COUNT(*) FILTER (WHERE EXTRACT(QUARTER FROM date_received::date) = 3) AS Q3,
    COUNT(*) FILTER (WHERE EXTRACT(QUARTER FROM date_received::date) = 4) AS Q4
FROM
    complaints
WHERE
    EXTRACT(YEAR FROM date_received::date)=2023
GROUP BY
    product,
    sub_product,
ORDER BY
    product ASC,
    sub_product ASC,
